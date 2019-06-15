-- Is my first interpreter, I think is not optimized, but it works!

repeat
  io.input(arg[1])
  if #arg == 0 then io.write(": ") end
  local vector = setmetatable({}, { __index = function(t, k) return (k < 1 or k > 30000) and error("out of memory") or 0 end })
  local ptr = 1
  local char
  local loop_stack = {}
  local i = 1 -- Corresponds to actual chunk's character being read
  local loop_end = false
  local chunk = arg[1] and io.read("*all") or io.read()

  repeat
    char = chunk and string.byte(chunk, i) -- if there isn't any chunk, char is `nil`
    if not loop_end and (char == 43 or char == 45) then -- +, -
      vector[ptr] = vector[ptr] - (char - 44)
      if vector[ptr] < 0 then vector[ptr] = 255
      elseif vector[ptr] > 255 then vector[ptr] = 0
      end
    elseif not loop_end and (char == 60 or char == 62) then -- >, <
      ptr = ptr + (char - 61)
    elseif not loop_end and char == 46 then -- .
      io.write(string.char(vector[ptr]))
    elseif not loop_end and char == 44 then -- ,
      local input = string.byte(io.input(io.stdin):read(1))
      if input < 1 then vector[ptr] = 0 else vector[ptr] = input end
    elseif char == 91 then -- [
      if loop_end then
        loop_end = loop_end + 1
      elseif vector[ptr] == 0 then
        loop_end = #loop_stack
      else
        loop_stack[#loop_stack + 1] = i
      end
    elseif char == 93 then -- ]
      if loop_end then
        if loop_end == #loop_stack then loop_end = nil else loop_end = loop_end - 1 end
      elseif vector[ptr] ~= 0 then
        i = loop_stack[#loop_stack]
      else
        loop_stack[#loop_stack] = nil
      end
    end
    i = i + 1
  until not char
  if #arg > 0 then io.close(); break end
until not chunk