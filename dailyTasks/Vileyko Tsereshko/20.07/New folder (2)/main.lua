function love.load()
	i=(math.random(0,9))

end

function love.draw()
	drawn(math.random(0,9), 100,100)
end

function drawn(i, x, y)
	if i == 0 then 
		zero(100,100)
	end

	if i == 1 then 
		one(100,100)
	end

	if i == 2 then 
		two(100,100)
	end

	if i == 3 then 
		three(100,100)
	end

	if i == 4 then 
		four(100,100)
	end

	if i == 5 then 
		five(100,100)
	end

	if i == 6 then 
		six(100,100)
	end

	if i == 7 then 
		seven(100,100)
	end

	if i == 8 then 
		eight(100,100)
	end

	if i == 9 then 
		nine(100,100)
	end
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