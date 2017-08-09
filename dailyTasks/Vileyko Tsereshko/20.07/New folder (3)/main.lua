function love.load()
end

function love.draw()
	--one(100,100)
	local n = 19254 --love.math.random(0,200)
	local k = n
	local v =500
	repeat
		drawn(math.floor(k%10) , v, 100)
		v=v-60
		k = k /10
		--print (k)
	until k <= 10
	if k > 0 then
		drawn(math.floor(k%10) , v, 100)
			v=v-60
	end
end
function love.update()

end

function drawn(i, x,y)
	if i == 0 then 
		zero(x,y)
	end

	if i == 1 then 
		one(x,y)
	end

	if i == 2 then 
		two(x,y)
	end

	if i == 3 then 
		three(x,y)
	end

	if i == 4 then 
		four(x,y)
	end

	if i == 5 then 
		five(x,y)
	end

	if i == 6 then 
		six(x,y)
	end

	if i == 7 then 
		seven(x,y)
	end

	if i == 8 then 
		eight(x,y)
	end

	if i == 9 then 
		nine(x,y)
	end
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
