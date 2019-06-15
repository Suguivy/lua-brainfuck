# lua-brainfuck
A Brainfuck interpreter written in Lua.

## Usage
Simply run it with a Lua interpreter or the LuaJIT compiler. You can pass an argument containing the route of the Brainfuck file to run, or run it with no arguments to read instructions line by line using the standard input.

## Examples
Running a file
```
luajit lua-brainfuk <my_brainfuck_file.bf>
```

Running the interpreter and putting instructions line by line
```
luajit lua-brainfuk
```
