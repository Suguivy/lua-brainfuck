# lua-brainfuck
A Brainfuck interpreter written in Lua.

## Usage
Simply run it with a Lua interpreter or the LuaJIT compiler. You can pass an argument containing the route of the Brainfuck file to run, or run it with no arguments to read instructions line by line using the standard input.

## Examples
Running a file
```
luajit lua-brainfuck.lua <my_brainfuck_file>
```

Running the interpreter and putting instructions line by line
```
luajit lua-brainfuck.lua
```
