function love.load()
  x,y = 100,100
  x1,y1 = 400,400
  oldx,oldy,oldx1,oldy1 = 0,0,0,0
  speed = 300
  r = 50
  r2 = 70
  wh = love.graphics.getWidth()
  he = love.graphics.getHeight()
end

function love.draw()
  love.graphics.circle("fill",x,y,r)
  love.graphics.circle("line",x1,y1,r2)
  love.graphics.print(math.abs(1 / delttime) .. "fps", 700,100)
  love.graphics.print("X -- " .. math.abs( x - x1), 700,25)
  love.graphics.print("Y -- " .. math.abs( y - y1), 700, 60)
end

function love.update(dt)
  delttime = dt
  oldx = x
  oldy = y
  oldx1 = x1
  oldy1 = y1
  
  
  if love.keyboard.isDown('a') then
    x = x - speed * dt
  elseif love.keyboard.isDown('d') then
    x = x + speed * dt
  elseif love.keyboard.isDown('w') then
    y = y - speed * dt
  elseif love.keyboard.isDown('s') then
    y = y + speed * dt
  end
  if love.keyboard.isDown('left') then
    x1 = x1 -speed * dt
  elseif love.keyboard.isDown('right') then
    x1 = x1 + speed * dt
  elseif love.keyboard.isDown('up') then
    y1 = y1 - speed * dt
  elseif love.keyboard.isDown('down') then
    y1 = y1 + speed * dt
  end
  
  
  if x - r < 0 then  x = 0 + r end
  if x + r > wh then  x = wh - r end
  if y - r < 0 then  y = 0 + r end
  if y + r > he then  y = he - r end
  
  if x1 - r2 < 0 then  x1 = 0 + r2 end
  if x1 + r2 > wh then  x1 = wh - r2 end
  if y1 - r2 < 0 then  y1 = 0 + r2 end
  if y1 + r2 > he then  y1 = he - r2 end
  
  if check() == 1 then
    x = oldx
    y = oldy
    x1 = oldx1
    y1 = oldy1
  end
end

function check()
  if math.sqrt((x-x1)^2+(y-y1)^2) < r+r2 then
    return 1
  else
    return 0
  end
end

