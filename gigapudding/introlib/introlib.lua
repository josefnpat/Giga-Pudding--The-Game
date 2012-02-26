music = love.audio.newSource("assets/GigaPudding.mp3")
music:setLooping(true)

love.audio.setVolume(0.25)
love.audio.play(music)

assets = {}
assets.city = love.graphics.newImage("assets/city.png")
assets.donut0 = love.graphics.newImage("assets/donut0.png")
assets.fullbow = love.graphics.newImage("assets/fullbow.png")
assets.puddi = love.graphics.newImage("assets/puddi.png")
assets.puddiquad = {}
for i = 0,10 do
  assets.puddiquad[i+1]=love.graphics.newQuad(i*77,0,77,61,847,61)
end
assets.puddititle = love.graphics.newImage("assets/puddititle.png")
assets.soniam = love.graphics.newImage("assets/soniam.png")
assets.datpuddi = love.graphics.newImage("assets/datpuddi.png")
assets.title = love.graphics.newImage("assets/title.png")
assets.bgcolor = {r = 3, g = 112, b = 194}
assets.barcolor = {r = 255, g = 159, b = 23}
assets.font = love.graphics.newFont("assets/Sniglet-Regular.ttf",32)
assets.font_large = love.graphics.newFont("assets/Sniglet-Regular.ttf",64)



introlib = {}

-------------------------------------
-- introlib.load
-------------------------------------
function introlib.load (arg)
  state = "intro"
  love.graphics.setFont(assets.font)
  introlib.dt = 0 
end

-------------------------------------
-- introlib.update
-------------------------------------
function introlib.update (dt)
  if state == "intro" then
    introlib.dt = introlib.dt + dt
  end  
end

-------------------------------------
-- introlib.draw
-------------------------------------
function introlib.draw ()
  if state == "intro" then
    local temp = 0
    temp = math.pi*(introlib.dt % 2)
    love.graphics.setColor(assets.bgcolor.r,assets.bgcolor.g,assets.bgcolor.b)
    love.graphics.rectangle("fill",0,0,800,600)
    love.graphics.setColor(255,255,255)
    love.graphics.draw(assets.fullbow,
      400,
      500+600-(assets.fullbow:getHeight()*800/assets.fullbow:getWidth()),
      math.sin(temp)+math.pi/4,
      800/assets.fullbow:getWidth(),
      800/assets.fullbow:getWidth(),
      assets.fullbow:getWidth()/2,
      assets.fullbow:getHeight()
    )
    temp = introlib.dt%math.pi
    love.graphics.draw(assets.puddititle,800/2-assets.puddititle:getWidth()/2*2,50+600-assets.puddititle:getHeight()*2-math.sin(temp)*100,0,2)
    love.graphics.draw(assets.city,0,(600-assets.city:getHeight()*800/assets.city:getWidth()),0,800/assets.city:getWidth())
    love.graphics.setColor(assets.barcolor.r,assets.barcolor.g,assets.barcolor.b)
    love.graphics.rectangle("fill",0,550,800,600)
    love.graphics.setColor(255,255,255)
    love.graphics.draw(assets.title,(800/2)-assets.title:getWidth()/2,20)
    love.graphics.setColor(assets.bgcolor.r,assets.bgcolor.g,assets.bgcolor.b)
    love.graphics.printf("Press any key!",0,558,800,"center")
    love.graphics.setColor(255,255,255)
  end  
end

-------------------------------------
-- introlib.keypressed
-------------------------------------
function introlib.keypressed (key,unicode)
  if state == "intro" then
    if end_state_temp then
      end_state_temp = nil
    else
      state = "game"
    end
  end  
end

-------------------------------------
-- introlib.keyreleased
-------------------------------------
function introlib.keyreleased (key)
  if state == "intro" then
    
  end  
end

-------------------------------------
-- introlib.mousepressed
-------------------------------------
function introlib.mousepressed (x,y,button)
  if state == "intro" then
    
  end  
end

-------------------------------------
-- introlib.mousereleased
-------------------------------------
function introlib.mousereleased (x,y,button)
  if state == "intro" then
    
  end  
end

-------------------------------------
-- introlib.joystickpressed
-------------------------------------
function introlib.joystickpressed (joystick,button)
  if state == "intro" then
    
  end  
end

-------------------------------------
-- introlib.joystickreleased
-------------------------------------
function introlib.joystickreleased (joystick,button)
  if state == "intro" then
    
  end  
end

-------------------------------------
-- introlib.focus
-------------------------------------
function introlib.focus (f)
  if state == "intro" then
    
  end  
end

-------------------------------------
-- introlib.quit
-------------------------------------
function introlib.quit ()
  if state == "intro" then
    
  end  
end

