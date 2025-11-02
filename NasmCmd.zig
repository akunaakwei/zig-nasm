output_file: LazyPath,
run: *Step.Run,

pub const Options = struct {
    target: Build.ResolvedTarget,
    file: LazyPath,
};

pub fn init(nasm_dep: *Dependency, options: Options) *NasmCmd {
    const b = nasm_dep.builder;
    const name = std.fs.path.stem(options.file.getDisplayName());

    const run = b.addRunArtifact(nasm_dep.artifact("nasm"));
    run.setName(b.fmt("nasm {s}", .{name}));
    switch (options.target.result.ofmt) {
        .elf => switch (options.target.result.cpu.arch) {
            .x86_64 => run.addArg("-f elf32"),
            .x86 => run.addArg("-f elf64"),
            else => {
                const fail = b.addFail(b.fmt("unsupported target cpu arch {t}", .{options.target.result.cpu.arch}));
                run.step.dependOn(&fail.step);
            },
        },
        .coff => switch (options.target.result.cpu.arch) {
            .x86_64 => run.addArg("-f win64"),
            .x86 => run.addArg("-f win32"),
            else => {
                const fail = b.addFail(b.fmt("unsupported target cpu arch {t}", .{options.target.result.cpu.arch}));
                run.step.dependOn(&fail.step);
            },
        },
        .macho => switch (options.target.result.cpu.arch) {
            .x86_64 => run.addArg("-f macho64"),
            .x86 => run.addArg("-f macho32"),
            else => {
                const fail = b.addFail(b.fmt("unsupported target cpu arch {t}", .{options.target.result.cpu.arch}));
                run.step.dependOn(&fail.step);
            },
        },
        else => {
            const fail = b.addFail(b.fmt("unsupported target object format {t}", .{options.target.result.ofmt}));
            run.step.dependOn(&fail.step);
        },
    }

    const output_file = run.addPrefixedOutputFileArg("-o", b.fmt("{s}.obj", .{std.fs.path.stem(name)}));
    run.addFileArg(options.file);

    const result = b.allocator.create(NasmCmd) catch @panic("OOM");
    result.* = .{
        .output_file = output_file,
        .run = run,
    };
    return result;
}

pub fn addIncludePath(nasm_cmd: *NasmCmd, path: LazyPath) void {
    nasm_cmd.run.addPrefixedDirectoryArg("-I", path);
}

const std = @import("std");
const Build = std.Build;
const LazyPath = Build.LazyPath;
const Step = Build.Step;
const Dependency = Build.Dependency;
const NasmCmd = @This();
