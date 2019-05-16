# lua-in-the-browser

This is the result of a
[2.5 hour live coding stream](https://youtu.be/DtZBac-IUBQ) in which I tried
to build [Lua](https://www.lua.org/) using [ZIG](https://ziglang.org/),
targeting [WebAssembly](https://webassembly.org/).

# Status

Able to produce `lib/lua.wasm`, however in the browser it says
`LinkError: import object field 'getc' is not a Function`.

To make further progress it is required to make modifications to Lua
source code in order to remove the dependency on a file system.

This depends on
[pending modifications to Zig](https://github.com/ziglang/zig/pull/2512).

# How to build it and run it

```
zig build install --prefix .
python3 -m http.server
```

Then visit the link printed with a modern browser such as Firefox.
