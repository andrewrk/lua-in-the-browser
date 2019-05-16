const Builder = @import("std").build.Builder;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    const cflags = [][]const u8{"-std=gnu99"};
    const c_files = [][]const u8{
        "src/lapi.c",
        "src/lauxlib.c",
        "src/lbaselib.c",
        "src/lbitlib.c",
        "src/lcode.c",
        "src/lcorolib.c",
        "src/lctype.c",
        "src/ldblib.c",
        "src/ldebug.c",
        "src/ldo.c",
        "src/ldump.c",
        "src/lfunc.c",
        "src/lgc.c",
        "src/linit.c",
        "src/llex.c",
        "src/lmathlib.c",
        "src/lmem.c",
        "src/lobject.c",
        "src/lopcodes.c",
        "src/loslib.c",
        "src/lparser.c",
        "src/lstate.c",
        "src/lstring.c",
        "src/lstrlib.c",
        "src/ltable.c",
        "src/ltablib.c",
        "src/ltm.c",
        "src/lua.c",
        "src/lundump.c",
        "src/lutf8lib.c",
        "src/lvm.c",
        "src/lzio.c",
    };

    const lib = b.addStaticLibrary("lua", null);
    lib.linkSystemLibrary("c");
    lib.setBuildMode(mode);
    lib.setTarget(builtin.Arch.wasm32, .freestanding, .musl);
    for (c_files) |c_file| {
        lib.addCSourceFile(c_file, cflags);
    }

    b.default_step.dependOn(&lib.step);

    b.installArtifact(lib);
}
