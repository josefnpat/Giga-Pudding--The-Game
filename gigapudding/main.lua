state = nil
require("endlib/endlib")
require("gamelib/gamelib")
require("introlib/introlib")

-------------------------------------
-- love.load
-------------------------------------
function love.load (arg)

  endlib.load(arg)

  gamelib.load(arg)

  introlib.load(arg)
  
end

-------------------------------------
-- love.update
-------------------------------------
function love.update (dt)

  endlib.update(dt)

  gamelib.update(dt)

  introlib.update(dt)
  
end

-------------------------------------
-- love.draw
-------------------------------------
function love.draw ()

  endlib.draw()

  gamelib.draw()

  introlib.draw()
  
end

-------------------------------------
-- love.keypressed
-------------------------------------
function love.keypressed (key,unicode)

  endlib.keypressed(key,unicode)

  gamelib.keypressed(key,unicode)

  introlib.keypressed(key,unicode)
  
end

-------------------------------------
-- love.keyreleased
-------------------------------------
function love.keyreleased (key)

  endlib.keyreleased(key)

  gamelib.keyreleased(key)

  introlib.keyreleased(key)
  
end

-------------------------------------
-- love.mousepressed
-------------------------------------
function love.mousepressed (x,y,button)

  endlib.mousepressed(x,y,button)

  gamelib.mousepressed(x,y,button)

  introlib.mousepressed(x,y,button)
  
end

-------------------------------------
-- love.mousereleased
-------------------------------------
function love.mousereleased (x,y,button)

  endlib.mousereleased(x,y,button)

  gamelib.mousereleased(x,y,button)

  introlib.mousereleased(x,y,button)
  
end

-------------------------------------
-- love.joystickpressed
-------------------------------------
function love.joystickpressed (joystick,button)

  endlib.joystickpressed(joystick,button)

  gamelib.joystickpressed(joystick,button)

  introlib.joystickpressed(joystick,button)
  
end

-------------------------------------
-- love.joystickreleased
-------------------------------------
function love.joystickreleased (joystick,button)

  endlib.joystickreleased(joystick,button)

  gamelib.joystickreleased(joystick,button)

  introlib.joystickreleased(joystick,button)
  
end

-------------------------------------
-- love.focus
-------------------------------------
function love.focus (f)

  endlib.focus(f)

  gamelib.focus(f)

  introlib.focus(f)
  
end

-------------------------------------
-- love.quit
-------------------------------------
function love.quit ()

  endlib.quit()

  gamelib.quit()

  introlib.quit()
  
end

