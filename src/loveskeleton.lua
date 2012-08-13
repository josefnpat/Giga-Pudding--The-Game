#!/usr/bin/env lua

function explode(div,str) -- credit: http://richard.warburton.it
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
    pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

if arg[1] then
  if arg[1] == "love" then
    a = arg[1]
    os.execute("ls | grep lib$ > tmp")
    io.input("tmp")
    grep = trim(io.read("*all"))
    if grep == "" then
      grep_tab = {}
    else
      grep_tab = explode("\n",grep)
    end
    os.remove("tmp")

    output = "state = nil\n"
    for i,v in ipairs(grep_tab) do
      output = output .. "require(\""..v.."/"..v.."\")\n"
    end
    output = output .. "\n"
  else
    a = arg[1] .. "lib"
    output = a .. " = {}\n\n"
  end
  fnames = {
    load={"arg"},
    update={"dt"},
    draw={},
    keypressed={"key","unicode"},
    keyreleased={"key"},
    mousepressed={"x","y","button"},
    mousereleased={"x","y","button"},
    joystickpressed={"joystick","button"},
    joystickreleased={"joystick","button"},
    focus={"f"},
    quit={}
  }
  fnames = {
    {name="load",             args={"arg"}},
    {name="update",           args={"dt"}},
    {name="draw",             args={}},
    {name="keypressed",       args={"key","unicode"}},
    {name="keyreleased",      args={"key"}},
    {name="mousepressed",     args={"x","y","button"}},
    {name="mousereleased",    args={"x","y","button"}},
    {name="joystickpressed",  args={"joystick","button"}},
    {name="joystickreleased", args={"joystick","button"}},
    {name="focus",            args={"f"}},
    {name="quit",             args={}},
  }
  sep = "-------------------------------------\n";
  for i,v in ipairs(fnames) do
    output = output .. sep .. "-- "..a..".".. v.name .."\n".. sep .."function "..a..".".. v.name .." (" .. table.concat(v.args,",") .. ")\n"
    if arg[1] == "love" then
      for j,w in ipairs(grep_tab) do
        output = output .. "\n  " .. w .. "." .. v.name .. "(" .. table.concat(v.args,",") .. ")\n"
      end
    else
      output = output .. "  if state == \""..arg[1].."\" then\n    \n  end"
    end
    output = output  .. "  \nend\n\n"
  end
  if arg[1] == "love" then
    io.output("main.lua")
  else
    os.execute("mkdir " .. a )
    io.output(a.."/"..a..".lua")
    os.execute("./loveskeleton.lua love")
  end
  io.write(output)
else
  print("Usage: ./loveskeleton.lua [<libname>|love]")
end

