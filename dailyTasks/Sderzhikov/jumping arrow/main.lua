tween = require 'tween'

function love.load()
  img = love.graphics.newImage('res/arrow.png')
  label = { x=200, y=0, image = img}
  labelTween = tween.new(4, label, {y = 500}, 'outBounce')
end

function love.draw()
  love.graphics.draw(label.image,label.x,label.y)
end

function love.update(dt)
  if labelTween:update(dt) then

    labelTween = tween.new(love.math.random(0.5,3), label, {y = love.math.random(10,600)},'outBounce')
    labelTween:update(dt)
  end
end