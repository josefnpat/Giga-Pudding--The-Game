gamelib = {}

-------------------------------------
-- gamelib.load
-------------------------------------
function gamelib.load (arg)
  gamelib.dt_sprite = 0
  gamelib.state = "standing"
  gamelib.playerx = 0
  gamelib.playery = 0
  gamelib.distance = 0
  gamelib.jump = false
  gamelib.jump_dt = 0
  gamelib.dt_time = 0
  gamelib.playersize = 11
  gamelib.score = 0
  gamelib.score_time = 0
  gamelib.donuts = {}
  gamelib.donuts_dt = 0
  gamelib.puddiscale = 1
  gamelib.px = 0
  gamelib.py = 0
  gamelib.win_cond = 100
  gamelib.current_donuts = 0
  gamelib.debug = false
  gamelib.showhappy = 0
end

-------------------------------------
-- gamelib.update
-------------------------------------
function gamelib.update (dt)
  if state == "game" then
    gamelib.score_time = gamelib.score_time + dt
    gamelib.donuts_dt = gamelib.donuts_dt + dt
    if gamelib.donuts_dt > 0.2 then
      local temp = {
        x = 900,
        y = math.random(50,450),
        s = math.random(1,5),
        rd = math.random(-1,1),
        r = 0
      }
      table.insert(gamelib.donuts,temp)
      gamelib.donuts_dt = 0
    end
    gamelib.px = gamelib.playerx+77/2*gamelib.puddiscale
    gamelib.py = gamelib.playery-61/2*gamelib.puddiscale
    local d = 0
    for i,v in ipairs(gamelib.donuts) do
      v.r = v.r + v.rd*dt
      v.x = v.x - 800*dt
      d = math.sqrt((v.x+assets.donut[1]:getWidth()/2-gamelib.px)^2+(v.y+assets.donut[1]:getWidth()/2-gamelib.py)^2)
      if d < 77/2*gamelib.puddiscale  + assets.donut[1]:getWidth()/2 then
        table.remove(gamelib.donuts,i)
        gamelib.playersize = gamelib.playersize + 0.1
        gamelib.showhappy = 8
      end
      if v.x < -200 then
        table.remove(gamelib.donuts,i)
      end
    end
    gamelib.dt_time = gamelib.dt_time + dt
    if gamelib.dt_time > 8 and gamelib.state ~= "eating" then
      gamelib.state = "eating"
      gamelib.dt_sprite = 0
    elseif gamelib.dt_time > 13 then
      gamelib.state = "standing"
      gamelib.dt_time = 0
      gamelib.dt_sprite = 0
      gamelib.playersize = gamelib.playersize-4
      if gamelib.playersize < 10 then
         gamelib.playersize = 0
        state = "end"
        endlib.playmusic()
      end
    end
    gamelib.dt_sprite = gamelib.dt_sprite + dt*2
    if love.keyboard.isDown("left") then
      gamelib.playerx = gamelib.playerx - 400*dt
      if gamelib.playerx < -50 then
        gamelib.playerx = -50
      end
    elseif love.keyboard.isDown("right") then
      gamelib.playerx = gamelib.playerx + 400*dt
      if gamelib.playerx > 400 then
        gamelib.playerx = 400
        gamelib.distance = gamelib.distance + 500*dt
      end
    end
    if gamelib.jump then
        gamelib.jump_dt = gamelib.jump_dt + dt*math.pi
        if gamelib.jump_dt > math.pi then
          gamelib.jump_dt = 0
          gamelib.jump = false
        end
    end
  end
  gamelib.score = math.floor(gamelib.playersize*(1/gamelib.score_time/60+1)*(gamelib.distance/100+400)/4)-1000
  gamelib.playery = 600-math.sin(gamelib.jump_dt)*400
  gamelib.current_donuts = math.floor((gamelib.playersize)*10)-100
  if gamelib.current_donuts >= gamelib.win_cond then
    state = "end"
    endlib.playmusic()
  end
end

-------------------------------------
-- gamelib.draw
-------------------------------------
function gamelib.draw ()
  if state == "game" then
    love.graphics.setColor(assets.bgcolor.r,assets.bgcolor.g,assets.bgcolor.b)
    love.graphics.rectangle("fill",0,0,800,600)
    love.graphics.setColor(255,255,255)
    local temp_sprite = 1
    if gamelib.state == "standing" then
      temp_sprite = math.floor(gamelib.dt_sprite % 2) + 4
    end
    if gamelib.showhappy > 0 then
      gamelib.showhappy = gamelib.showhappy - 1 
      temp_sprite = 6
    end
    if gamelib.state == "eating" then
      temp_sprite = (math.floor(gamelib.dt_sprite % 8) + 6 ) % 11 + 1
    end
    gamelib.puddiscale = math.log(gamelib.playersize)*1.5 - 1
    love.graphics.draw(assets.puddi[temp_sprite],
        gamelib.playerx,
        gamelib.playery-235/2,
        0,
        gamelib.puddiscale/4,
        gamelib.puddiscale/4,
        0,
        61)
    for _,v in ipairs(gamelib.donuts) do
      love.graphics.draw(assets.donut[v.s],v.x+assets.donut[1]:getWidth()/2,v.y+assets.donut[1]:getWidth()/2,v.r,1,1,assets.donut[1]:getWidth()/2,assets.donut[1]:getWidth()/2)
    end
    love.graphics.draw(assets.city,-gamelib.distance%800,(600-assets.city:getHeight()*800/assets.city:getWidth()),0,800/assets.city:getWidth())
    love.graphics.draw(assets.city,-gamelib.distance%800-800,(600-assets.city:getHeight()*800/assets.city:getWidth()),0,800/assets.city:getWidth())
    love.graphics.setColor(assets.barcolor.r,assets.barcolor.g,assets.barcolor.b)
    love.graphics.rectangle("fill",0,550,800,600)
    love.graphics.setColor(255,255,255)
    love.graphics.setColor(assets.bgcolor.r,assets.bgcolor.g,assets.bgcolor.b)

    love.graphics.printf("Score:"..gamelib.score,32,558,736,"left")
    love.graphics.printf(" Donuts:"..gamelib.current_donuts.."/"..gamelib.win_cond,32,558,736,"right")
    love.graphics.setColor(255,255,255)
    if gamelib.debug then
      love.graphics.circle("line", gamelib.px, gamelib.py, 77/2*gamelib.puddiscale,32)
      for _,v in ipairs(gamelib.donuts) do
        love.graphics.circle("line", v.x+assets.donut[1]:getWidth()/2, v.y+assets.donut[1]:getWidth()/2, assets.donut[1]:getWidth()/2,32)
      end
      love.graphics.print("playersize:"..gamelib.playersize.."\nScore time:"..math.floor(gamelib.score_time).."\nDistance:"..math.floor(gamelib.distance).."\n",0,0)
    end
  end  
end

-------------------------------------
-- gamelib.keypressed
-------------------------------------
function gamelib.keypressed (key,unicode)
  if state == "game" then
    if love.keyboard.isDown("up") and not gamelib.jump then
      gamelib.jump = true
      gamelib.jump_dt = 0
    end
    if key == "`" then
      gamelib.debug = not gamelib.debug 
    end
  end  
end

-------------------------------------
-- gamelib.keyreleased
-------------------------------------
function gamelib.keyreleased (key)
  if state == "game" then
    
  end  
end

-------------------------------------
-- gamelib.mousepressed
-------------------------------------
function gamelib.mousepressed (x,y,button)
  if state == "game" then
    
  end  
end

-------------------------------------
-- gamelib.mousereleased
-------------------------------------
function gamelib.mousereleased (x,y,button)
  if state == "game" then
    
  end  
end

-------------------------------------
-- gamelib.joystickpressed
-------------------------------------
function gamelib.joystickpressed (joystick,button)
  if state == "game" then
    
  end  
end

-------------------------------------
-- gamelib.joystickreleased
-------------------------------------
function gamelib.joystickreleased (joystick,button)
  if state == "game" then
    
  end  
end

-------------------------------------
-- gamelib.focus
-------------------------------------
function gamelib.focus (f)
  if state == "game" then
    
  end  
end

-------------------------------------
-- gamelib.quit
-------------------------------------
function gamelib.quit ()
  if state == "game" then
    
  end  
end
