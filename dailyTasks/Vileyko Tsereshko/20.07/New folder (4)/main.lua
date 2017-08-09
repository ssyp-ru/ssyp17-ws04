function love.load()
	r = 50
	r1 = 75
	x = 1
	y = 1
	x1 = 301
	y1 = 301
	speed = 10 
end
function love.draw()
	love.graphics.setColor(0, 0, 255)
	love.graphics.circle("fill", x, y, r)
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", x1, y1, r1)
	love.graphics.setColor(0, 255, 0)
	love.graphics.line(x, y, x1, y1)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("blue", x, y)
	love.graphics.print("red", x1, y1)
	love.graphics.print(math.sqrt(((x-x1)*(x-x1))+(y-y1)*(y-y1)), 670, 50)
end

function love.update()

	oldy = y
	oldx = x
	oldx1 = x1
	oldy1 = y1

	if x > love.graphics.getWidth() - r then x = love.graphics.getWidth() - r
	end

	if y > love.graphics.getHeight() - r then y = love.graphics.getHeight() - r 
	end

	if y < r then y = r
	end

	if x < r then x = r
	end

	if x1 > love.graphics.getWidth() - r1 then x1= love.graphics.getWidth() - r1
	end

	if y1 > love.graphics.getHeight() - r1 then y1 = love.graphics.getHeight() - r1 
	end

	if y1 < r1 then y1 = r1
	end

	if x1 < r1 then x1 = r1
	end

	if love.keyboard.isDown('w') then
		y = y-speed
	end
	if love.keyboard.isDown('s') then
		y=y+speed
	end

	if love.keyboard.isDown('a') then
		x=x-speed
	end

	if love.keyboard.isDown('d') then
		x=x+speed
	end


	if love.keyboard.isDown('up') then
		y1 = y1-speed
	end
	if love.keyboard.isDown('down') then
		y1 = y1+speed
	end

	if love.keyboard.isDown('left') then
		x1 = x1-speed
	end

	if love.keyboard.isDown('right') then
		x1 = x1+speed
	end

	if math.sqrt(((x-x1)*(x-x1))+(y-y1)*(y-y1)) < r+r1 then 
		x = oldx
		y = oldy
		x1 = oldx1
		y1 = oldy1
		
	end
end