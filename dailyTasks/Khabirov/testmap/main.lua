sti = require 'libs/sti'

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
end

function love.draw()
  love.graphics.setColor(255, 255, 255)
  map:draw(-tx, -ty)
  player.draw()
  love.graphics.print("Fps = " .. math.floor(fps), 10,70)
  love.graphics.print("tx = " .. math.floor( -tx), 10,90)
  love.graphics.print("ty = " .. math.floor( -ty), 10,110)
end

function love.update(dt)
  fps = 1 / dt
  if love.keyboard.isDown('escape') then
    love.event.quit()
  end
  world:update(dt)
  map:update(dt)

  -- Move map
  local kd = love.keyboard.isDown

  local l  = kd("left")  or kd("a")
  local r  = kd("right") or kd("d")
  local u  = kd("up")    or kd("w")
  local d  = kd("down")  or kd("s")

  tx = l and tx - speed * dt or tx
  tx = r and tx + speed * dt or tx
  ty = u and ty - speed * dt or ty
  ty = d and ty + speed * dt or ty


  player.update(dt)
end

function love.keypressed(key)
  if key == 'lshift' or key == 'rshift' then
    speed = 100
    need = 0.3
  end
end

function love.keyreleased(key)
  if key == 'lshift' or key == 'rshift' then
    speed = 200
    need = 1.5
  end
end