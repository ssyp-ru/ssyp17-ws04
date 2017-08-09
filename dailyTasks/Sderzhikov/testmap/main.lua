sti = require 'libs/sti'
require 'gooi'

require 'player'

function love.load()
  speed = 200
  player.load()
  -- map
  map = sti("map/map.lua",{'box2d'}) 
  tx,ty = -100,-170
  -- world
  love.physics.setMeter(32)
  world = love.physics.newWorld(0,0)
  map:box2d_init(world)
  j = gooi.newJoy({size = 100})
  panelGrid = gooi.newPanel({x=0, y=0, w=love.graphics.getWidth(), h=love.graphics.getHeight(),layout = "game"})
  panelGrid:add(j:setDigital(),       "b-l")
  panelGrid:add(gooi.newButton("Action 1"):setText("exit(net)"),     "b-r")
  panelGrid:add(gooi.newButton("Action 2"):setText("Nichego"),     "b-r")
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  map:draw(-tx, -ty)
  player.draw()
  love.graphics.print("Fps = " .. math.floor(fps), 10,70)
  love.graphics.print("tx = " .. math.floor( -tx), 10,90)
  love.graphics.print("ty = " .. math.floor( -ty), 10,110)
  gooi.draw()
end

function love.update(dt)
  fps = 1 / dt
  if love.keyboard.isDown('escape') then 
    love.event.quit()
  end
  world:update(dt)
  map:update(dt)
  gooi.update(dt)
  player.tec:update(dt)

  -- Move map
  local kd = love.keyboard.isDown
  dir = j:direction()

--  local l  = kd("left")  or kd("a")
--  local r  = kd("right") or kd("d")
--  local u  = kd("up")    or kd("w")
--  local d  = kd("down")  or kd("s")
  --descktop version moving
--  tx = l and tx - speed * dt or tx
--  tx = r and tx + speed * dt or tx
--  ty = u and ty - speed * dt or ty
--  ty = d and ty + speed * dt or ty


  if dir:match("l") then
    tx = tx - dt * 150
    player.tec = player.animation_left; last = 3
  elseif dir:match("r") then
    player.tec = player.animation_right; last = 4
    tx = tx + dt * 150
  end
  --mobile version moving
  if dir:match("t") then
    player.tec = player.animation_back; last = 1
    ty = ty - dt * 150
  elseif dir:match("b") then
    player.tec = player.animation_front; last = 2
    ty = ty + dt * 150
  end

  player.update(dt)
end

function love.keypressed(key, scancode, isrepeat)
  gooi.keypressed(key, scancode, isrepeat)
  if key == "escape" then
    love.event.quit()
  end
  if key == 'lshift' or key == 'rshift' then
    speed = 100
    need = 0.3
  end
end
function love.keyreleased(key, scancode)
  gooi.keyreleased(key, scancode)
  if key == 'lshift' or key == 'rshift' then
    speed = 200
    need = 1.5
  end
end

function player.update(dt)
  lk = love.keyboard.isDown
  if lk('w') or lk('up')then player.tec = player.animation_back; last = 1
  elseif lk('s') or lk('down') then player.tec = player.animation_front; last = 2
  elseif lk('a') or lk('left') then player.tec = player.animation_left; last = 3
  elseif lk('d') or lk('right') then player.tec = player.animation_right; last = 4
  else
    if last == 1 then player.tec = player.stayb
    elseif last == 2 then player.tec = player.stayf
    elseif last == 3 then player.tec = player.stayl
    elseif last == 4 then player.tec = player.stayr
    end
  end

  -- table = map:getTileProperties('walkable',10,10)

  --print (#table)
end


function love.mousepressed(x, y, button)  gooi.pressed() end
function love.mousereleased(x, y, button) gooi.released() end
