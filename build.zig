const std = @import("std");

pub const NasmCmd = @import("NasmCmd.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const abort_on_panic = b.option(bool, "ABORT_ON_PANIC", "ABORT_ON_PANIC") orelse null;
    const ac_apple_universal_build = b.option(bool, "AC_APPLE_UNIVERSAL_BUILD", "AC_APPLE_UNIVERSAL_BUILD") orelse null;
    const have_access = b.option(bool, "HAVE_ACCESS", "HAVE_ACCESS") orelse true;
    const have_canonicalize_file_name = b.option(bool, "HAVE_CANONICALIZE_FILE_NAME", "HAVE_CANONICALIZE_FILE_NAME") orelse null;
    const have_cpu_to_le16 = b.option(bool, "HAVE_CPU_TO_LE16", "HAVE_CPU_TO_LE16") orelse null;
    const have_cpu_to_le32 = b.option(bool, "HAVE_CPU_TO_LE32", "HAVE_CPU_TO_LE32") orelse null;
    const have_cpu_to_le64 = b.option(bool, "HAVE_CPU_TO_LE64", "HAVE_CPU_TO_LE64") orelse null;
    const have_decl_strcasecmp = b.option(bool, "HAVE_DECL_STRCASECMP", "HAVE_DECL_STRCASECMP") orelse true;
    const have_decl_stricmp = b.option(bool, "HAVE_DECL_STRICMP", "HAVE_DECL_STRICMP") orelse false;
    const have_decl_strlcpy = b.option(bool, "HAVE_DECL_STRLCPY", "HAVE_DECL_STRLCPY") orelse if (target.result.os.tag != .windows) true else null;
    const have_decl_strncasecmp = b.option(bool, "HAVE_DECL_STRNCASECMP", "HAVE_DECL_STRNCASECMP") orelse true;
    const have_decl_strnicmp = b.option(bool, "HAVE_DECL_STRNICMP", "HAVE_DECL_STRNICMP") orelse false;
    const have_decl_strnlen = b.option(bool, "HAVE_DECL_STRNLEN", "HAVE_DECL_STRNLEN") orelse true;
    const have_decl_strrchrnul = b.option(bool, "HAVE_DECL_STRRCHRNUL", "HAVE_DECL_STRRCHRNUL") orelse false;
    const have_decl_strsep = b.option(bool, "HAVE_DECL_STRSEP", "HAVE_DECL_STRSEP") orelse true;
    const have_endian_h = b.option(bool, "HAVE_ENDIAN_H", "HAVE_ENDIAN_H") orelse if (target.result.os.tag != .windows and !target.result.os.tag.isDarwin()) true else null;
    const have_faccessat = b.option(bool, "HAVE_FACCESSAT", "HAVE_FACCESSAT") orelse true;
    const have_fcntl_h = b.option(bool, "HAVE_FCNTL_H", "HAVE_FCNTL_H") orelse true;
    const have_fileno = b.option(bool, "HAVE_FILENO", "HAVE_FILENO") orelse true;
    const have_fseeko = b.option(bool, "HAVE_FSEEKO", "HAVE_FSEEKO") orelse true;
    const have_fstat = b.option(bool, "HAVE_FSTAT", "HAVE_FSTAT") orelse true;
    const have_ftruncate = b.option(bool, "HAVE_FTRUNCATE", "HAVE_FTRUNCATE") orelse true;
    const have_func_attribute1_alloc_size = b.option(bool, "HAVE_FUNC_ATTRIBUTE1_ALLOC_SIZE", "HAVE_FUNC_ATTRIBUTE1_ALLOC_SIZE") orelse true;
    const have_func_attribute2_alloc_size = b.option(bool, "HAVE_FUNC_ATTRIBUTE2_ALLOC_SIZE", "HAVE_FUNC_ATTRIBUTE2_ALLOC_SIZE") orelse true;
    const have_func_attribute3_format = b.option(bool, "HAVE_FUNC_ATTRIBUTE3_FORMAT", "HAVE_FUNC_ATTRIBUTE3_FORMAT") orelse true;
    const have_func_attribute_cold = b.option(bool, "HAVE_FUNC_ATTRIBUTE_COLD", "HAVE_FUNC_ATTRIBUTE_COLD") orelse true;
    const have_func_attribute_const = b.option(bool, "HAVE_FUNC_ATTRIBUTE_CONST", "HAVE_FUNC_ATTRIBUTE_CONST") orelse true;
    const have_func_attribute_error = b.option(bool, "HAVE_FUNC_ATTRIBUTE_ERROR", "HAVE_FUNC_ATTRIBUTE_ERROR") orelse true;
    const have_func_attribute_malloc = b.option(bool, "HAVE_FUNC_ATTRIBUTE_MALLOC", "HAVE_FUNC_ATTRIBUTE_MALLOC") orelse true;
    const have_func_attribute_noreturn = b.option(bool, "HAVE_FUNC_ATTRIBUTE_NORETURN", "HAVE_FUNC_ATTRIBUTE_NORETURN") orelse true;
    const have_func_attribute_pure = b.option(bool, "HAVE_FUNC_ATTRIBUTE_PURE", "HAVE_FUNC_ATTRIBUTE_PURE") orelse true;
    const have_func_attribute_returns_nonnull = b.option(bool, "HAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL", "HAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL") orelse true;
    const have_func_attribute_sentinel = b.option(bool, "HAVE_FUNC_ATTRIBUTE_SENTINEL", "HAVE_FUNC_ATTRIBUTE_SENTINEL") orelse true;
    const have_func_attribute_unused = b.option(bool, "HAVE_FUNC_ATTRIBUTE_UNUSED", "HAVE_FUNC_ATTRIBUTE_UNUSED") orelse true;
    const have_func_ptr_attribute1_alloc_size = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE1_ALLOC_SIZE", "HAVE_FUNC_PTR_ATTRIBUTE1_ALLOC_SIZE") orelse true;
    const have_func_ptr_attribute2_alloc_size = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE2_ALLOC_SIZE", "HAVE_FUNC_PTR_ATTRIBUTE2_ALLOC_SIZE") orelse true;
    const have_func_ptr_attribute3_format = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE3_FORMAT", "HAVE_FUNC_PTR_ATTRIBUTE3_FORMAT") orelse true;
    const have_func_ptr_attribute_cold = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_COLD", "HAVE_FUNC_PTR_ATTRIBUTE_COLD") orelse null;
    const have_func_ptr_attribute_const = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_CONST", "HAVE_FUNC_PTR_ATTRIBUTE_CONST") orelse true;
    const have_func_ptr_attribute_malloc = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_MALLOC", "HAVE_FUNC_PTR_ATTRIBUTE_MALLOC") orelse null;
    const have_func_ptr_attribute_noreturn = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_NORETURN", "HAVE_FUNC_PTR_ATTRIBUTE_NORETURN") orelse true;
    const have_func_ptr_attribute_pure = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_PURE", "HAVE_FUNC_PTR_ATTRIBUTE_PURE") orelse true;
    const have_func_ptr_attribute_returns_nonnull = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_RETURNS_NONNULL", "HAVE_FUNC_PTR_ATTRIBUTE_RETURNS_NONNULL") orelse null;
    const have_func_ptr_attribute_sentinel = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_SENTINEL", "HAVE_FUNC_PTR_ATTRIBUTE_SENTINEL") orelse null;
    const have_func_ptr_attribute_unused = b.option(bool, "HAVE_FUNC_PTR_ATTRIBUTE_UNUSED", "HAVE_FUNC_PTR_ATTRIBUTE_UNUSED") orelse true;
    const have_getgid = b.option(bool, "HAVE_GETGID", "HAVE_GETGID") orelse true;
    const have_getpagesize = b.option(bool, "HAVE_GETPAGESIZE", "HAVE_GETPAGESIZE") orelse if (target.result.os.tag != .windows) true else null;
    const have_getrlimit = b.option(bool, "HAVE_GETRLIMIT", "HAVE_GETRLIMIT") orelse true;
    const have_getuid = b.option(bool, "HAVE_GETUID", "HAVE_GETUID") orelse true;
    const have_htole16 = b.option(bool, "HAVE_HTOLE16", "HAVE_HTOLE16") orelse true;
    const have_htole32 = b.option(bool, "HAVE_HTOLE32", "HAVE_HTOLE32") orelse true;
    const have_htole64 = b.option(bool, "HAVE_HTOLE64", "HAVE_HTOLE64") orelse true;
    const have_intrin_h = b.option(bool, "HAVE_INTRIN_H", "HAVE_INTRIN_H") orelse null;
    const have_inttypes_h = b.option(bool, "HAVE_INTTYPES_H", "HAVE_INTTYPES_H") orelse true;
    const have_io_h = b.option(bool, "HAVE_IO_H", "HAVE_IO_H") orelse null;
    const have_isascii = b.option(bool, "HAVE_ISASCII", "HAVE_ISASCII") orelse true;
    const have_iscntrl = b.option(bool, "HAVE_ISCNTRL", "HAVE_ISCNTRL") orelse true;
    const have_machine_endian_h = b.option(bool, "HAVE_MACHINE_ENDIAN_H", "HAVE_MACHINE_ENDIAN_H") orelse if (target.result.os.tag.isDarwin()) true else null;
    const have_mempcpy = b.option(bool, "HAVE_MEMPCPY", "HAVE_MEMPCPY") orelse if (target.result.abi.isGnu()) true else null;
    const have_mempset = b.option(bool, "HAVE_MEMPSET", "HAVE_MEMPSET") orelse null;
    const have_minix_config_h = b.option(bool, "HAVE_MINIX_CONFIG_H", "HAVE_MINIX_CONFIG_H") orelse null;
    const have_mmap = b.option(bool, "HAVE_MMAP", "HAVE_MMAP") orelse if (target.result.os.tag != .windows and target.result.os.tag != .wasi) true else null;
    const have_pathconf = b.option(bool, "HAVE_PATHCONF", "HAVE_PATHCONF") orelse true;
    const have_realpath = b.option(bool, "HAVE_REALPATH", "HAVE_REALPATH") orelse if (target.result.os.tag != .windows) true else null;
    const have_snprintf = b.option(bool, "HAVE_SNPRINTF", "HAVE_SNPRINTF") orelse true;
    const have_stat = b.option(bool, "HAVE_STAT", "HAVE_STAT") orelse true;
    const have_stdarg_h = b.option(bool, "HAVE_STDARG_H", "HAVE_STDARG_H") orelse true;
    const have_stdbool_h = b.option(bool, "HAVE_STDBOOL_H", "HAVE_STDBOOL_H") orelse true;
    const have_stdc_inline = b.option(bool, "HAVE_STDC_INLINE", "HAVE_STDC_INLINE") orelse true;
    const have_stdint_h = b.option(bool, "HAVE_STDINT_H", "HAVE_STDINT_H") orelse true;
    const have_stdio_h = b.option(bool, "HAVE_STDIO_H", "HAVE_STDIO_H") orelse true;
    const have_stdlib_h = b.option(bool, "HAVE_STDLIB_H", "HAVE_STDLIB_H") orelse true;
    const have_stdnoreturn_h = b.option(bool, "HAVE_STDNORETURN_H", "HAVE_STDNORETURN_H") orelse true;
    const have_strcasecmp = b.option(bool, "HAVE_STRCASECMP", "HAVE_STRCASECMP") orelse true;
    const have_stricmp = b.option(bool, "HAVE_STRICMP", "HAVE_STRICMP") orelse null;
    const have_strings_h = b.option(bool, "HAVE_STRINGS_H", "HAVE_STRINGS_H") orelse true;
    const have_string_h = b.option(bool, "HAVE_STRING_H", "HAVE_STRING_H") orelse true;
    const have_strlcpy = b.option(bool, "HAVE_STRLCPY", "HAVE_STRLCPY") orelse if (!target.result.abi.isGnu()) true else null;
    const have_strncasecmp = b.option(bool, "HAVE_STRNCASECMP", "HAVE_STRNCASECMP") orelse true;
    const have_strnicmp = b.option(bool, "HAVE_STRNICMP", "HAVE_STRNICMP") orelse null;
    const have_strnlen = b.option(bool, "HAVE_STRNLEN", "HAVE_STRNLEN") orelse true;
    const have_strrchrnul = b.option(bool, "HAVE_STRRCHRNUL", "HAVE_STRRCHRNUL") orelse null;
    const have_strsep = b.option(bool, "HAVE_STRSEP", "HAVE_STRSEP") orelse if (target.result.os.tag != .windows) true else null;
    const have_struct_stat = b.option(bool, "HAVE_STRUCT_STAT", "HAVE_STRUCT_STAT") orelse true;
    const have_struct__stati64 = b.option(bool, "HAVE_STRUCT__STATI64", "HAVE_STRUCT__STATI64") orelse null;
    const have_sysconf = b.option(bool, "HAVE_SYSCONF", "HAVE_SYSCONF") orelse true;
    const have_sys_endian_h = b.option(bool, "HAVE_SYS_ENDIAN_H", "HAVE_SYS_ENDIAN_H") orelse null;
    const have_sys_mman_h = b.option(bool, "HAVE_SYS_MMAN_H", "HAVE_SYS_MMAN_H") orelse if (target.result.os.tag != .windows and target.result.os.tag != .wasi) true else null;
    const have_sys_param_h = b.option(bool, "HAVE_SYS_PARAM_H", "HAVE_SYS_PARAM_H") orelse true;
    const have_sys_resource_h = b.option(bool, "HAVE_SYS_RESOURCE_H", "HAVE_SYS_RESOURCE_H") orelse if (target.result.os.tag != .windows and target.result.os.tag != .wasi) true else null;
    const have_sys_stat_h = b.option(bool, "HAVE_SYS_STAT_H", "HAVE_SYS_STAT_H") orelse true;
    const have_sys_types_h = b.option(bool, "HAVE_SYS_TYPES_H", "HAVE_SYS_TYPES_H") orelse true;
    const have_s_isreg = b.option(bool, "HAVE_S_ISREG", "HAVE_S_ISREG") orelse null;
    const have_typeof = b.option(bool, "HAVE_TYPEOF", "HAVE_TYPEOF") orelse true;
    const have_uintptr_t = b.option(bool, "HAVE_UINTPTR_T", "HAVE_UINTPTR_T") orelse true;
    const have_unistd_h = b.option(bool, "HAVE_UNISTD_H", "HAVE_UNISTD_H") orelse true;
    const have_variadic_macros = b.option(bool, "HAVE_VARIADIC_MACROS", "HAVE_VARIADIC_MACROS") orelse true;
    const have_vsnprintf = b.option(bool, "HAVE_VSNPRINTF", "HAVE_VSNPRINTF") orelse true;
    const have_wchar_h = b.option(bool, "HAVE_WCHAR_H", "HAVE_WCHAR_H") orelse true;
    const have__access = b.option(bool, "HAVE__ACCESS", "HAVE__ACCESS") orelse null;
    const have__bitscanreverse = b.option(bool, "HAVE__BITSCANREVERSE", "HAVE__BITSCANREVERSE") orelse null;
    const have__bitscanreverse64 = b.option(bool, "HAVE__BITSCANREVERSE64", "HAVE__BITSCANREVERSE64") orelse null;
    const have__bool = b.option(bool, "HAVE__BOOL", "HAVE__BOOL") orelse true;
    const have__byteswap_uint64 = b.option(bool, "HAVE__BYTESWAP_UINT64", "HAVE__BYTESWAP_UINT64") orelse null;
    const have__byteswap_ulong = b.option(bool, "HAVE__BYTESWAP_ULONG", "HAVE__BYTESWAP_ULONG") orelse null;
    const have__byteswap_ushort = b.option(bool, "HAVE__BYTESWAP_USHORT", "HAVE__BYTESWAP_USHORT") orelse null;
    const have__chsize = b.option(bool, "HAVE__CHSIZE", "HAVE__CHSIZE") orelse null;
    const have__chsize_s = b.option(bool, "HAVE__CHSIZE_S", "HAVE__CHSIZE_S") orelse null;
    const have__fileno = b.option(bool, "HAVE__FILENO", "HAVE__FILENO") orelse null;
    const have__fseeki64 = b.option(bool, "HAVE__FSEEKI64", "HAVE__FSEEKI64") orelse null;
    const have__fstati64 = b.option(bool, "HAVE__FSTATI64", "HAVE__FSTATI64") orelse null;
    const have__fullpath = b.option(bool, "HAVE__FULLPATH", "HAVE__FULLPATH") orelse null;
    const have__stati64 = b.option(bool, "HAVE__STATI64", "HAVE__STATI64") orelse null;
    const have___bswap_16 = b.option(bool, "HAVE___BSWAP_16", "HAVE___BSWAP_16") orelse true;
    const have___bswap_32 = b.option(bool, "HAVE___BSWAP_32", "HAVE___BSWAP_32") orelse true;
    const have___bswap_64 = b.option(bool, "HAVE___BSWAP_64", "HAVE___BSWAP_64") orelse true;
    const have___builtin_bswap16 = b.option(bool, "HAVE___BUILTIN_BSWAP16", "HAVE___BUILTIN_BSWAP16") orelse true;
    const have___builtin_bswap32 = b.option(bool, "HAVE___BUILTIN_BSWAP32", "HAVE___BUILTIN_BSWAP32") orelse true;
    const have___builtin_bswap64 = b.option(bool, "HAVE___BUILTIN_BSWAP64", "HAVE___BUILTIN_BSWAP64") orelse true;
    const have___builtin_choose_expr = b.option(bool, "HAVE___BUILTIN_CHOOSE_EXPR", "HAVE___BUILTIN_CHOOSE_EXPR") orelse true;
    const have___builtin_clz = b.option(bool, "HAVE___BUILTIN_CLZ", "HAVE___BUILTIN_CLZ") orelse true;
    const have___builtin_clzl = b.option(bool, "HAVE___BUILTIN_CLZL", "HAVE___BUILTIN_CLZL") orelse true;
    const have___builtin_clzll = b.option(bool, "HAVE___BUILTIN_CLZLL", "HAVE___BUILTIN_CLZLL") orelse true;
    const have___builtin_constant_p = b.option(bool, "HAVE___BUILTIN_CONSTANT_P", "HAVE___BUILTIN_CONSTANT_P") orelse true;
    const have___builtin_expect = b.option(bool, "HAVE___BUILTIN_EXPECT", "HAVE___BUILTIN_EXPECT") orelse true;
    const have___cpu_to_le16 = b.option(bool, "HAVE___CPU_TO_LE16", "HAVE___CPU_TO_LE16") orelse null;
    const have___cpu_to_le32 = b.option(bool, "HAVE___CPU_TO_LE32", "HAVE___CPU_TO_LE32") orelse null;
    const have___cpu_to_le64 = b.option(bool, "HAVE___CPU_TO_LE64", "HAVE___CPU_TO_LE64") orelse null;
    const ldflags_wl_as_needed = b.option(bool, "LDFLAGS_WL_AS_NEEDED", "LDFLAGS_WL_AS_NEEDED") orelse true;
    const ldflags_wl_gc_sections = b.option(bool, "LDFLAGS_WL_GC_SECTIONS", "LDFLAGS_WL_GC_SECTIONS") orelse true;
    const package_bugreport = b.option([]const u8, "PACKAGE_BUGREPORT", "PACKAGE_BUGREPORT") orelse "";
    const package_name = b.option([]const u8, "PACKAGE_NAME", "PACKAGE_NAME") orelse "";
    const package_string = b.option([]const u8, "PACKAGE_STRING", "PACKAGE_STRING") orelse "";
    const package_tarname = b.option([]const u8, "PACKAGE_TARNAME", "PACKAGE_TARNAME") orelse "";
    const package_url = b.option([]const u8, "PACKAGE_URL", "PACKAGE_URL") orelse "";
    const package_version = b.option([]const u8, "PACKAGE_VERSION", "PACKAGE_VERSION") orelse "";
    const stdc_headers = b.option(bool, "STDC_HEADERS", "STDC_HEADERS") orelse true;
    const words_bigendian = b.option(bool, "WORDS_BIGENDIAN", "WORDS_BIGENDIAN") orelse if (target.result.cpu.arch.endian() == .big) true else null;
    const words_littleendian = b.option(bool, "WORDS_LITTLEENDIAN", "WORDS_LITTLEENDIAN") orelse if (target.result.cpu.arch.endian() == .little) true else null;
    const _file_offset_bits = b.option(bool, "_FILE_OFFSET_BITS", "_FILE_OFFSET_BITS") orelse null;
    const _largefile_source = b.option(bool, "_LARGEFILE_SOURCE", "_LARGEFILE_SOURCE") orelse null;
    const _large_files = b.option(bool, "_LARGE_FILES", "_LARGE_FILES") orelse null;
    const size_t = b.option(bool, "size_t", "size_t") orelse null;
    const snprintf = b.option(bool, "snprintf", "snprintf") orelse null;
    const uintptr_t = b.option(bool, "uintptr_t", "uintptr_t") orelse null;
    const vsnprintf = b.option(bool, "vsnprintf", "vsnprintf") orelse null;
    const _all_source = b.option(bool, "_ALL_SOURCE", "_ALL_SOURCE") orelse null;
    const _darwin_c_source = b.option(bool, "_DARWIN_C_SOURCE", "_DARWIN_C_SOURCE") orelse null;
    const __extensions__ = b.option(bool, "__EXTENSIONS__", "__EXTENSIONS__") orelse null;
    const _gnu_source = b.option(bool, "_GNU_SOURCE", "_GNU_SOURCE") orelse if (target.result.abi.isGnu()) true else null;
    const _hpux_alt_xopen_socket_api = b.option(bool, "_HPUX_ALT_XOPEN_SOCKET_API", "_HPUX_ALT_XOPEN_SOCKET_API") orelse null;
    const _minix = b.option(bool, "_MINIX", "_MINIX") orelse null;
    const _netbsd_source = b.option(bool, "_NETBSD_SOURCE", "_NETBSD_SOURCE") orelse null;
    const _openbsd_source = b.option(bool, "_OPENBSD_SOURCE", "_OPENBSD_SOURCE") orelse null;
    const _posix_source = b.option(bool, "_POSIX_SOURCE", "_POSIX_SOURCE") orelse null;
    const _posix_1_source = b.option(bool, "_POSIX_1_SOURCE", "_POSIX_1_SOURCE") orelse null;
    const _posix_pthread_semantics = b.option(bool, "_POSIX_PTHREAD_SEMANTICS", "_POSIX_PTHREAD_SEMANTICS") orelse null;
    const __stdc_want_iec_60559_attribs_ext__ = b.option(bool, "__STDC_WANT_IEC_60559_ATTRIBS_EXT__", "__STDC_WANT_IEC_60559_ATTRIBS_EXT__") orelse null;
    const __stdc_want_iec_60559_bfp_ext__ = b.option(bool, "__STDC_WANT_IEC_60559_BFP_EXT__", "__STDC_WANT_IEC_60559_BFP_EXT__") orelse null;
    const __stdc_want_iec_60559_dfp_ext__ = b.option(bool, "__STDC_WANT_IEC_60559_DFP_EXT__", "__STDC_WANT_IEC_60559_DFP_EXT__") orelse null;
    const __stdc_want_iec_60559_funcs_ext__ = b.option(bool, "__STDC_WANT_IEC_60559_FUNCS_EXT__", "__STDC_WANT_IEC_60559_FUNCS_EXT__") orelse null;
    const __stdc_want_iec_60559_types_ext__ = b.option(bool, "__STDC_WANT_IEC_60559_TYPES_EXT__", "__STDC_WANT_IEC_60559_TYPES_EXT__") orelse null;
    const __stdc_want_lib_ext2__ = b.option(bool, "__STDC_WANT_LIB_EXT2__", "__STDC_WANT_LIB_EXT2__") orelse null;
    const __stdc_want_math_spec_funcs__ = b.option(bool, "__STDC_WANT_MATH_SPEC_FUNCS__", "__STDC_WANT_MATH_SPEC_FUNCS__") orelse null;
    const _tandem_source = b.option(bool, "_TANDEM_SOURCE", "_TANDEM_SOURCE") orelse null;
    const _xopen_source = b.option(bool, "_XOPEN_SOURCE", "_XOPEN_SOURCE") orelse null;

    const nasm_dep = b.dependency("nasm", .{});

    const config = b.addConfigHeader(.{
        .include_path = "config/config.h",
        .style = .{ .autoconf_undef = nasm_dep.path("config/config.h.in") },
    }, .{
        .ABORT_ON_PANIC = abort_on_panic,
        .AC_APPLE_UNIVERSAL_BUILD = ac_apple_universal_build,
        .CFLAGS_FDATA_SECTIONS = null,
        .CFLAGS_FFAT_LTO_OBJECTS = null,
        .CFLAGS_FFUNCTION_SECTIONS = null,
        .CFLAGS_FGNU89_INLINE = null,
        .CFLAGS_FLTO = null,
        .CFLAGS_FLTO_AUTO = null,
        .CFLAGS_FNO_COMMON = null,
        .CFLAGS_FNO_OMIT_FRAME_POINTER = null,
        .CFLAGS_FSANITIZE_ADDRESS = null,
        .CFLAGS_FSANITIZE_UNDEFINED = null,
        .CFLAGS_FTRIVIAL_AUTO_VAR_INIT_ZERO = null,
        .CFLAGS_FVISIBILITY_HIDDEN = null,
        .CFLAGS_FWRAPV = null,
        .CFLAGS_G3 = null,
        .CFLAGS_GGDB3 = null,
        .CFLAGS_O0 = null,
        .CFLAGS_OG = null,
        .CFLAGS_PEDANTIC = null,
        .CFLAGS_PG = null,
        .CFLAGS_U_STRICT_ANSI = null,
        .CFLAGS_W = null,
        .CFLAGS_WALL = null,
        .CFLAGS_WERROR = null,
        .CFLAGS_WERROR_COMMENT = null,
        .CFLAGS_WERROR_IMPLICIT = null,
        .CFLAGS_WERROR_MISSING_BRACES = null,
        .CFLAGS_WERROR_MISSING_DECLARATIONS = null,
        .CFLAGS_WERROR_MISSING_PROTOTYPES = null,
        .CFLAGS_WERROR_POINTER_ARITH = null,
        .CFLAGS_WERROR_RETURN_TYPE = null,
        .CFLAGS_WERROR_STRICT_PROTOTYPES = null,
        .CFLAGS_WERROR_TRIGRAPHS = null,
        .CFLAGS_WERROR_UNKNOWN_WARNING_OPTION = null,
        .CFLAGS_WERROR_VLA = null,
        .CFLAGS_WNO_LONG_LONG = null,
        .CFLAGS_WNO_PEDANTIC_MS_FORMAT = null,
        .CFLAGS_WNO_SHIFT_NEGATIVE_VALUE = null,
        .CFLAGS_WNO_STRINGOP_TRUNCATION = null,
        .CFLAGS_WNO_VARIADIC_MACROS = null,
        .CFLAGS_WSUGGEST_ATTRIBUTE_COLD = null,
        .CFLAGS_WSUGGEST_ATTRIBUTE_CONST = null,
        .CFLAGS_WSUGGEST_ATTRIBUTE_FORMAT = null,
        .CFLAGS_WSUGGEST_ATTRIBUTE_MALLOC = null,
        .CFLAGS_WSUGGEST_ATTRIBUTE_NORETURN = null,
        .CFLAGS_WSUGGEST_ATTRIBUTE_PURE = null,
        .CPPFLAGS_STD_C11 = null,
        .CPPFLAGS_STD_C17 = null,
        .CPPFLAGS_STD_C99 = null,
        .CPPFLAGS_WERROR_ATTRIBUTES = null,
        .HAVE_ACCESS = have_access,
        .HAVE_CANONICALIZE_FILE_NAME = have_canonicalize_file_name,
        .HAVE_CPU_TO_LE16 = have_cpu_to_le16,
        .HAVE_CPU_TO_LE32 = have_cpu_to_le32,
        .HAVE_CPU_TO_LE64 = have_cpu_to_le64,
        .HAVE_DECL_STRCASECMP = have_decl_strcasecmp,
        .HAVE_DECL_STRICMP = have_decl_stricmp,
        .HAVE_DECL_STRLCPY = have_decl_strlcpy,
        .HAVE_DECL_STRNCASECMP = have_decl_strncasecmp,
        .HAVE_DECL_STRNICMP = have_decl_strnicmp,
        .HAVE_DECL_STRNLEN = have_decl_strnlen,
        .HAVE_DECL_STRRCHRNUL = have_decl_strrchrnul,
        .HAVE_DECL_STRSEP = have_decl_strsep,
        .HAVE_ENDIAN_H = have_endian_h,
        .HAVE_FACCESSAT = have_faccessat,
        .HAVE_FCNTL_H = have_fcntl_h,
        .HAVE_FILENO = have_fileno,
        .HAVE_FSEEKO = have_fseeko,
        .HAVE_FSTAT = have_fstat,
        .HAVE_FTRUNCATE = have_ftruncate,
        .HAVE_FUNC_ATTRIBUTE1_ALLOC_SIZE = have_func_attribute1_alloc_size,
        .HAVE_FUNC_ATTRIBUTE2_ALLOC_SIZE = have_func_attribute2_alloc_size,
        .HAVE_FUNC_ATTRIBUTE3_FORMAT = have_func_attribute3_format,
        .HAVE_FUNC_ATTRIBUTE_COLD = have_func_attribute_cold,
        .HAVE_FUNC_ATTRIBUTE_CONST = have_func_attribute_const,
        .HAVE_FUNC_ATTRIBUTE_ERROR = have_func_attribute_error,
        .HAVE_FUNC_ATTRIBUTE_MALLOC = have_func_attribute_malloc,
        .HAVE_FUNC_ATTRIBUTE_NORETURN = have_func_attribute_noreturn,
        .HAVE_FUNC_ATTRIBUTE_PURE = have_func_attribute_pure,
        .HAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL = have_func_attribute_returns_nonnull,
        .HAVE_FUNC_ATTRIBUTE_SENTINEL = have_func_attribute_sentinel,
        .HAVE_FUNC_ATTRIBUTE_UNUSED = have_func_attribute_unused,
        .HAVE_FUNC_PTR_ATTRIBUTE1_ALLOC_SIZE = have_func_ptr_attribute1_alloc_size,
        .HAVE_FUNC_PTR_ATTRIBUTE2_ALLOC_SIZE = have_func_ptr_attribute2_alloc_size,
        .HAVE_FUNC_PTR_ATTRIBUTE3_FORMAT = have_func_ptr_attribute3_format,
        .HAVE_FUNC_PTR_ATTRIBUTE_COLD = have_func_ptr_attribute_cold,
        .HAVE_FUNC_PTR_ATTRIBUTE_CONST = have_func_ptr_attribute_const,
        .HAVE_FUNC_PTR_ATTRIBUTE_MALLOC = have_func_ptr_attribute_malloc,
        .HAVE_FUNC_PTR_ATTRIBUTE_NORETURN = have_func_ptr_attribute_noreturn,
        .HAVE_FUNC_PTR_ATTRIBUTE_PURE = have_func_ptr_attribute_pure,
        .HAVE_FUNC_PTR_ATTRIBUTE_RETURNS_NONNULL = have_func_ptr_attribute_returns_nonnull,
        .HAVE_FUNC_PTR_ATTRIBUTE_SENTINEL = have_func_ptr_attribute_sentinel,
        .HAVE_FUNC_PTR_ATTRIBUTE_UNUSED = have_func_ptr_attribute_unused,
        .HAVE_GETGID = have_getgid,
        .HAVE_GETPAGESIZE = have_getpagesize,
        .HAVE_GETRLIMIT = have_getrlimit,
        .HAVE_GETUID = have_getuid,
        .HAVE_HTOLE16 = have_htole16,
        .HAVE_HTOLE32 = have_htole32,
        .HAVE_HTOLE64 = have_htole64,
        .HAVE_INTRIN_H = have_intrin_h,
        .HAVE_INTTYPES_H = have_inttypes_h,
        .HAVE_IO_H = have_io_h,
        .HAVE_ISASCII = have_isascii,
        .HAVE_ISCNTRL = have_iscntrl,
        .HAVE_MACHINE_ENDIAN_H = have_machine_endian_h,
        .HAVE_MEMPCPY = have_mempcpy,
        .HAVE_MEMPSET = have_mempset,
        .HAVE_MINIX_CONFIG_H = have_minix_config_h,
        .HAVE_MMAP = have_mmap,
        .HAVE_PATHCONF = have_pathconf,
        .HAVE_REALPATH = have_realpath,
        .HAVE_SNPRINTF = have_snprintf,
        .HAVE_STAT = have_stat,
        .HAVE_STDARG_H = have_stdarg_h,
        .HAVE_STDBOOL_H = have_stdbool_h,
        .HAVE_STDC_INLINE = have_stdc_inline,
        .HAVE_STDINT_H = have_stdint_h,
        .HAVE_STDIO_H = have_stdio_h,
        .HAVE_STDLIB_H = have_stdlib_h,
        .HAVE_STDNORETURN_H = have_stdnoreturn_h,
        .HAVE_STRCASECMP = have_strcasecmp,
        .HAVE_STRICMP = have_stricmp,
        .HAVE_STRINGS_H = have_strings_h,
        .HAVE_STRING_H = have_string_h,
        .HAVE_STRLCPY = have_strlcpy,
        .HAVE_STRNCASECMP = have_strncasecmp,
        .HAVE_STRNICMP = have_strnicmp,
        .HAVE_STRNLEN = have_strnlen,
        .HAVE_STRRCHRNUL = have_strrchrnul,
        .HAVE_STRSEP = have_strsep,
        .HAVE_STRUCT_STAT = have_struct_stat,
        .HAVE_STRUCT__STATI64 = have_struct__stati64,
        .HAVE_SYSCONF = have_sysconf,
        .HAVE_SYS_ENDIAN_H = have_sys_endian_h,
        .HAVE_SYS_MMAN_H = have_sys_mman_h,
        .HAVE_SYS_PARAM_H = have_sys_param_h,
        .HAVE_SYS_RESOURCE_H = have_sys_resource_h,
        .HAVE_SYS_STAT_H = have_sys_stat_h,
        .HAVE_SYS_TYPES_H = have_sys_types_h,
        .HAVE_S_ISREG = have_s_isreg,
        .HAVE_TYPEOF = have_typeof,
        .HAVE_UINTPTR_T = have_uintptr_t,
        .HAVE_UNISTD_H = have_unistd_h,
        .HAVE_VARIADIC_MACROS = have_variadic_macros,
        .HAVE_VSNPRINTF = have_vsnprintf,
        .HAVE_WCHAR_H = have_wchar_h,
        .HAVE__ACCESS = have__access,
        .HAVE__BITSCANREVERSE = have__bitscanreverse,
        .HAVE__BITSCANREVERSE64 = have__bitscanreverse64,
        .HAVE__BOOL = have__bool,
        .HAVE__BYTESWAP_UINT64 = have__byteswap_uint64,
        .HAVE__BYTESWAP_ULONG = have__byteswap_ulong,
        .HAVE__BYTESWAP_USHORT = have__byteswap_ushort,
        .HAVE__CHSIZE = have__chsize,
        .HAVE__CHSIZE_S = have__chsize_s,
        .HAVE__FILENO = have__fileno,
        .HAVE__FSEEKI64 = have__fseeki64,
        .HAVE__FSTATI64 = have__fstati64,
        .HAVE__FULLPATH = have__fullpath,
        .HAVE__STATI64 = have__stati64,
        .HAVE___BSWAP_16 = have___bswap_16,
        .HAVE___BSWAP_32 = have___bswap_32,
        .HAVE___BSWAP_64 = have___bswap_64,
        .HAVE___BUILTIN_BSWAP16 = have___builtin_bswap16,
        .HAVE___BUILTIN_BSWAP32 = have___builtin_bswap32,
        .HAVE___BUILTIN_BSWAP64 = have___builtin_bswap64,
        .HAVE___BUILTIN_CHOOSE_EXPR = have___builtin_choose_expr,
        .HAVE___BUILTIN_CLZ = have___builtin_clz,
        .HAVE___BUILTIN_CLZL = have___builtin_clzl,
        .HAVE___BUILTIN_CLZLL = have___builtin_clzll,
        .HAVE___BUILTIN_CONSTANT_P = have___builtin_constant_p,
        .HAVE___BUILTIN_EXPECT = have___builtin_expect,
        .HAVE___CPU_TO_LE16 = have___cpu_to_le16,
        .HAVE___CPU_TO_LE32 = have___cpu_to_le32,
        .HAVE___CPU_TO_LE64 = have___cpu_to_le64,
        .LDFLAGS_WL_AS_NEEDED = ldflags_wl_as_needed,
        .LDFLAGS_WL_GC_SECTIONS = ldflags_wl_gc_sections,
        .PACKAGE_BUGREPORT = package_bugreport,
        .PACKAGE_NAME = package_name,
        .PACKAGE_STRING = package_string,
        .PACKAGE_TARNAME = package_tarname,
        .PACKAGE_URL = package_url,
        .PACKAGE_VERSION = package_version,
        .STDC_HEADERS = stdc_headers,
        .WORDS_BIGENDIAN = words_bigendian,
        .WORDS_LITTLEENDIAN = words_littleendian,
        ._FILE_OFFSET_BITS = _file_offset_bits,
        ._LARGEFILE_SOURCE = _largefile_source,
        ._LARGE_FILES = _large_files,
        .@"const" = .@"const",
        .@"inline" = .@"inline",
        .restrict = .restrict,
        .size_t = size_t,
        .snprintf = snprintf,
        .typeof = .__typeof,
        .uintptr_t = uintptr_t,
        .vsnprintf = vsnprintf,
        ._ALL_SOURCE = _all_source,
        ._DARWIN_C_SOURCE = _darwin_c_source,
        .__EXTENSIONS__ = __extensions__,
        ._GNU_SOURCE = _gnu_source,
        ._HPUX_ALT_XOPEN_SOCKET_API = _hpux_alt_xopen_socket_api,
        ._MINIX = _minix,
        ._NETBSD_SOURCE = _netbsd_source,
        ._OPENBSD_SOURCE = _openbsd_source,
        ._POSIX_SOURCE = _posix_source,
        ._POSIX_1_SOURCE = _posix_1_source,
        ._POSIX_PTHREAD_SEMANTICS = _posix_pthread_semantics,
        .__STDC_WANT_IEC_60559_ATTRIBS_EXT__ = __stdc_want_iec_60559_attribs_ext__,
        .__STDC_WANT_IEC_60559_BFP_EXT__ = __stdc_want_iec_60559_bfp_ext__,
        .__STDC_WANT_IEC_60559_DFP_EXT__ = __stdc_want_iec_60559_dfp_ext__,
        .__STDC_WANT_IEC_60559_FUNCS_EXT__ = __stdc_want_iec_60559_funcs_ext__,
        .__STDC_WANT_IEC_60559_TYPES_EXT__ = __stdc_want_iec_60559_types_ext__,
        .__STDC_WANT_LIB_EXT2__ = __stdc_want_lib_ext2__,
        .__STDC_WANT_MATH_SPEC_FUNCS__ = __stdc_want_math_spec_funcs__,
        ._TANDEM_SOURCE = _tandem_source,
        ._XOPEN_SOURCE = _xopen_source,
    });

    const flags = .{
        "-std=c17",
        "-fwrapv",
        "-ftrivial-auto-var-init=zero",
        "-fno-common",
        "-fvisibility=hidden",
        "-Wno-date-time",
        "-DHAVE_CONFIG_H=1",
    };

    const libnasm = b.addLibrary(.{
        .name = "libnasm",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
        }),
    });
    libnasm.linkLibC();
    libnasm.addConfigHeader(config);
    libnasm.addIncludePath(nasm_dep.path("include"));
    libnasm.addIncludePath(nasm_dep.path("asm"));
    libnasm.addIncludePath(nasm_dep.path("x86"));
    libnasm.addIncludePath(nasm_dep.path("output"));
    libnasm.addIncludePath(nasm_dep.path("."));
    libnasm.addCSourceFiles(.{
        .root = nasm_dep.path("nasmlib"),
        .files = &nasmlib_sources,
        .flags = &flags,
    });
    libnasm.addCSourceFiles(.{
        .root = nasm_dep.path("stdlib"),
        .files = &stdlib_sources,
        .flags = &flags,
    });
    libnasm.addCSourceFiles(.{
        .root = nasm_dep.path("x86"),
        .files = &x86_sources,
        .flags = &flags,
    });
    libnasm.addCSourceFiles(.{
        .root = nasm_dep.path("common"),
        .files = &common_sources,
        .flags = &flags,
    });
    libnasm.addCSourceFiles(.{
        .root = nasm_dep.path("macros"),
        .files = &macros_sources,
        .flags = &flags,
    });
    libnasm.addCSourceFiles(.{
        .root = nasm_dep.path("output"),
        .files = &output_sources,
        .flags = &flags,
    });
    libnasm.addCSourceFiles(.{
        .root = nasm_dep.path("asm"),
        .files = &.{ "error.c", "warnings.c" },
        .flags = &flags,
    });
    b.installArtifact(libnasm);

    const nasm = b.addExecutable(.{
        .name = "nasm",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
        }),
    });
    nasm.linkLibC();
    nasm.addConfigHeader(config);
    nasm.linkLibrary(libnasm);
    nasm.addIncludePath(nasm_dep.path("include"));
    nasm.addIncludePath(nasm_dep.path("asm"));
    nasm.addIncludePath(nasm_dep.path("x86"));
    nasm.addIncludePath(nasm_dep.path("output"));
    nasm.addIncludePath(nasm_dep.path("."));
    nasm.addCSourceFiles(.{
        .root = nasm_dep.path("asm"),
        .files = &asm_sources,
        .flags = &flags,
    });
    b.installArtifact(nasm);

    const ndisasm = b.addExecutable(.{
        .name = "ndisasm",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
        }),
    });
    ndisasm.linkLibC();
    ndisasm.addConfigHeader(config);
    ndisasm.linkLibrary(libnasm);
    ndisasm.addIncludePath(nasm_dep.path("include"));
    ndisasm.addIncludePath(nasm_dep.path("asm"));
    ndisasm.addIncludePath(nasm_dep.path("x86"));
    ndisasm.addIncludePath(nasm_dep.path("."));
    ndisasm.addCSourceFiles(.{
        .root = nasm_dep.path("disasm"),
        .files = &disasm_sources,
        .flags = &flags,
    });
    ndisasm.addCSourceFiles(.{
        .root = nasm_dep.path("asm"),
        .files = &.{"error.c"},
        .flags = &flags,
    });
    b.installArtifact(ndisasm);
}

const nasmlib_sources = .{
    "alloc.c",
    "asprintf.c",
    "badenum.c",
    "bsi.c",
    "crc32.c",
    "crc64.c",
    "errfile.c",
    "file.c",
    "filename.c",
    "hashtbl.c",
    "ilog2.c",
    "md5c.c",
    "mmap.c",
    "nctype.c",
    "numstr.c",
    "path.c",
    "perfhash.c",
    "raa.c",
    "rbtree.c",
    "readnum.c",
    "realpath.c",
    "rlimit.c",
    "saa.c",
    "string.c",
    "strlist.c",
    "ver.c",
    "zerobuf.c",
};

const stdlib_sources = .{
    "snprintf.c",
    "strlcpy.c",
    "strnlen.c",
    "strrchrnul.c",
    "vsnprintf.c",
};

const x86_sources = .{
    "disp8.c",
    "iflag.c",
    "insnsa.c",
    "insnsb.c",
    "insnsd.c",
    "insnsn.c",
    "regdis.c",
    "regflags.c",
    "regs.c",
    "regvals.c",
};

const common_sources = .{"common.c"};
const macros_sources = .{"macros.c"};

const output_sources = .{
    "codeview.c",
    "legacy.c",
    "nulldbg.c",
    "nullout.c",
    "outaout.c",
    "outas86.c",
    "outbin.c",
    "outcoff.c",
    "outdbg.c",
    "outelf.c",
    "outform.c",
    "outieee.c",
    "outlib.c",
    "outmacho.c",
    "outobj.c",
};

const asm_sources = .{
    "assemble.c",
    "directbl.c",
    "directiv.c",
    // "error.c",
    "eval.c",
    "exprdump.c",
    "exprlib.c",
    "floats.c",
    "labels.c",
    "listing.c",
    "nasm.c",
    "parser.c",
    "pptok.c",
    "pragma.c",
    "preproc.c",
    "quote.c",
    "rdstrnum.c",
    "segalloc.c",
    "srcfile.c",
    "stdscan.c",
    "strfunc.c",
    "tokhash.c",
    // "warnings.c",
};

const disasm_sources = .{
    "disasm.c",
    "ndisasm.c",
    "sync.c",
};
