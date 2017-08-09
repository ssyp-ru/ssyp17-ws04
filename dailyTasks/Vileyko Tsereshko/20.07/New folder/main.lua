function love.load()
	love.graphics.setLineWidth (2)
	love.graphics.setColor(255, 255, 255)
love.graphics.setLineJoin( "none" )
end

function love.draw()
	one(math.random(2, 800),math.random(2, 800))
	two(math.random(2, 800),math.random(2, 800))
	three(math.random(2, 800),math.random(2, 800))
	four(math.random(2, 800),math.random(2, 800))
	five(math.random(2, 800),math.random(2, 800))
	six(math.random(2, 800),math.random(2, 800))
	seven(math.random(2, 800),math.random(2, 800))
	eight(math.random(2, 800),math.random(2, 800))
	nine(math.random(2, 800),math.random(2, 800))
	zero(math.random(2, 800),math.random(2, 800))
end

function love.update(dt)

end
function one (x,y)
	a={x, y+30, x+30, y, x+30, y+90}
	love.graphics.line(a)
end

function two (x,y)
	a={x, y, x+50, y, x, y+90,x+50, y+90}
	love.graphics.line(a)
end

function three (x,y)
	a={x, y, x+50, y, x, y+50,x+50, y+50,x, y+100}
	love.graphics.line(a)
end

function four (x,y)
	a={x, y, x, y+50, x+50, y+50, x+50, y, x+50, y+100}
	love.graphics.line(a)
end

function five (x,y)
	a={x+50, y, x, y, x, y+50, x+50, y+50, x+50, y+100, x, y+100}
	love.graphics.line(a)
end

function six (x,y)
	a={x+50, y, x, y, x, y+50, x+50, y+50, x+50, y+100, x, y+100, x, y+50}
	love.graphics.line(a)
end

function seven (x,y)
	a={x, y, x+50, y, x, y+100}
	love.graphics.line(a)
end

function eight (x,y)
	a={x, y, x+50, y, x, y+100,x+50, y+100,x, y}
	love.graphics.line(a)
end

function nine (x,y)
	a={x+50, y+50, x, y+50, x, y, x+50, y,x+50, y+50, x, y+100}
	love.graphics.line(a)
end

function zero (x,y)
	a={x, y, x, y+100, x+50, y+100, x+50, y, x, y}
	love.graphics.line(a)
end
