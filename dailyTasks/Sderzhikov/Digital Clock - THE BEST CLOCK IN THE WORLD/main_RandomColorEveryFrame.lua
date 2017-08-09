require 'os'
tween = require "tween"

function love.load()

  

  love.window.setFullscreen(true)

  font = love.graphics.newFont('comic.ttf',70)
  love.graphics.setFont(font)
  love.graphics.setColor(10,200,36)
  love.graphics.setBackgroundColor(1,1,1,1)
  fps = 0
  speed = 3
  time = {}
  time.text = os.date("%X")
  time.x = 0
  time.y = 0
  timeTween = tween.new(speed,time,{y = love.graphics.getHeight() - 70},'inOutBack')
  date = {}
  date.text = os.date("%x")
  date.x = love.graphics.getWidth() - 330
  date.y = time.y + 50 
  dateTween = tween.new(speed,time,{y = time.y + 50},'inOutBack')
  math.randomseed(os.time())
end

function love.draw()
  love.graphics.print(time.text,time.x,time.y)
  love.graphics.print(date.text,date.x,date.y)
--  love.graphics.print(math.floor(fps),love.graphics.getWidth() /2,love.graphics.getHeight() /2) -- fps drawing
end

function love.update(dt)
  if dt > 0.040 then return end
  fps = 1/dt
  time.text = os.date("%X")
  r = love.math.random(100,255)
  g = love.math.random(100,255)
  b = love.math.random(100,255)
  love.graphics.setColor(r,g,b)
  if timeTween:update(dt) then

    timeTween = tween.new(speed,time,{y = love.math.random(0,love.graphics.getHeight() - 70)},'inOutBack')
    timeTween:update(dt)
  end
  if dateTween:update(dt) then
    dateTween = tween.new(speed,date,{y = love.math.random(0,love.graphics.getHeight() - 70)},'inOutBack')
    dateTween:update(dt)
  end
end


function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end