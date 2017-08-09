function love.load()
  love.graphics.setBackgroundColor(255,255,255)

  minuta = os.date("%M")
  chas = os.date("%I")
  secunda = os.date("%S")
  hourS = love.graphics.newImage("chas.png")
  minuteS =love.graphics.newImage("minuta.png")
  secondS = love.graphics.newImage("secunda.png")
end

function love.draw()
  drawClock(chas,minuta,secunda)
end

function love.update(dt)
  minuta = os.date("%M")
  chas = os.date("%I")
  secunda = os.date("%S")
end


function drawClock(chas,minuta,secunda)
  drawBase()
  drawHour(chas)
  drawMinute(minuta)
  drawSecond(secunda) 
end

function drawHour(chas)
  rot = ((chas * (math.pi * 2)) / 12) - (math.pi * 2 /4)
  love.graphics.draw(hourS,love.graphics.getWidth() /2,love.graphics.getHeight() /2,rot,_,_,0,5)
end

function drawMinute(minuta)
  rot = ((minuta * (math.pi * 2)) / 60) - (math.pi * 2 /4)
  love.graphics.draw(minuteS,love.graphics.getWidth() /2,love.graphics.getHeight() /2,rot,_,_,0,5)
end

function drawSecond(secunda)
  rot = ((minuta * (math.pi * 2)) / 60) - (math.pi * 2 /4)
  love.graphics.draw(secondS,love.graphics.getWidth() /2,love.graphics.getHeight() /2,rot,_,_,0,5)
end

function drawBase()
  love.graphics.setColor(255,255,255)  love.graphics.circle("line",love.graphics.getWidth() /2,love.graphics.getHeight() /2,love.graphics.getHeight() / 2 - 2)
end