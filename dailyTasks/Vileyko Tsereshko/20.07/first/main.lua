function love.load()
	love.graphics.setLineWidth (2)
	love.graphics.setColor(255, 255, 255)
love.graphics.setLineJoin( "none" )
end

function love.draw()
	one(20,100)
	two(100,100)
	three(200,100)	
	four(300,100)
	five(400,100)
	six(500,100)
	seven(600,100)
	eight(700,100)
	nine(20,250)
	zero(100,250)
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