tween = require 'tween'
all = {}

function love.load()
  for k = 1, 10 do
    all[k] = {}
    
    all[k].img = love.graphics.newImage('res/arrow.png')
    all[k].label = { x=love.math.random(0,560), y=0, image = img}
    all[k].labelTween = tween.new(1, all[k].label, {y = 560}, 'outBounce')
    
  end
end
function love.draw()
  for i=1, #all do
    love.graphics.draw(all[i].img,all[i].label.x,all[i].label.y)
  end
end
function love.update(dt)
  if dt > 0.040 then return end -- HERE!
  for i =1, #all do
    if all[i].labelTween:update(dt) then
      print('pered')
      all[i].labelTween = tween.new(love.math.random(0.5,3), all[i].label, {y = love.math.random(0,560)},'outBounce')
      all[i].labelTween:update(dt)
      print('posleupdatea')
    end
  end
end