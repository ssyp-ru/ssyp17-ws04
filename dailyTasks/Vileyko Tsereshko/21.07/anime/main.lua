local tween = require "tween"
local Quad
local tank = {}

function love.load ()
	kart1 = love.graphics.newImage("arr.png")
	q1 = love.graphics.newQuad(0, 0, 42, 21, kart1:getWidth(), kart1:getHeight()) 
	label = {
		x=200, 
		p = 0,
		y = 0, 
		kartinka = kart1 
	} 
	labelTween = tween.new(3, label, {y=580 ,p = 6, x = 600}, 'inOutCubic')
end

function love.draw ()
	love.graphics.draw(label.kartinka,q1, label.x, label.y, label.p)
end

function love.update (dt)
	labelTween:update(dt)
end