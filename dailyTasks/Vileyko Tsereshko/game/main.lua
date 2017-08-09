--require('player')

function love.load()
	--player1 = Player:new(1, 1, 1, 1,1, 1)
	
	--player1:moveup()
	
	r = 50
	r1 = 75
	x = 50
	y = 50
	x1 = 725
	y1 = 525
	speed = 23
	speed1 = 12
	hp = 100
	damage = 19
	hp1 = 120
	damage1 = 14
	font1 = 1 
	k = false
	k1 = false
	time = 0
	wait = 0
	wait1 = 0
end
function love.draw()
	love.graphics.setNewFont(20)
	love.graphics.setColor(0, 0, 255)
	love.graphics.circle("fill", x, y, r)
	love.graphics.setColor(255, 0, 0)
	love.graphics.circle("fill", x1, y1, r1)
	love.graphics.setColor(0, 255, 0)
	--love.graphics.line(x, y, x1, y1)
	love.graphics.setColor(255, 255, 255)
	love.graphics.print("blue", x, y-60)
	love.graphics.print("red", x1, y1-85)
	-- love.graphics.print(math.sqrt(((x-x1)*(x-x1))+(y-y1)*(y-y1)), 670, 50)
	love.graphics.print("health -" ..hp , x, y)
	love.graphics.print("health -" ..hp1, x1, y1)

	if k == true then love.graphics.print ("blue win!", 350, 200)
	end

	if k1 == true then love.graphics.print ("red win!", 350, 200)

	end

	love.graphics.print("time:"..time, 650, 100)
	--time = math.floor(time)
end

function love.update(dt)
	if wait > 0 then
		wait = wait - dt
	end
	if wait1 > 0 then
		wait1 = wait1 - dt
	end
	oldy = y
	oldx = x
	oldx1 = x1
	oldy1 = y1
	time = time + dt

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
		y1 = y1-speed1
	end
	if love.keyboard.isDown('down') then
		y1 = y1+speed1
	end

	if love.keyboard.isDown('left') then
		x1 = x1-speed1
	end

	if love.keyboard.isDown('right') then
		x1 = x1+speed1
	end

	if math.sqrt(((x-x1)*(x-x1))+(y-y1)*(y-y1)) < r+r1 then 
		x = oldx
		y = oldy
		x1 = oldx1
		y1 = oldy1 

	end

	if hp == 0 then 
		damage = 0
	end

	if hp1 == 0 then
		damage1 = 0
	end
	if love.keyboard.isDown('space') and math.sqrt(((x-x1)*(x-x1))+(y-y1)*(y-y1)) < r+r1+59 and wait <= 0 then
		hp1 = hp1 - damage
		wait = 1.5
	end
	
	if damage  == 19 then
		love.graphics.line(x, y, x1, y1)
		
		end


	if love.keyboard.isDown("return") and math.sqrt(((x-x1)*(x-x1))+(y-y1)*(y-y1)) < r+r1+70 and wait1 <= 0 then
		hp = hp - damage1
		wait1 = 1.2
	end
	
	

	if hp < 1 then hp = 0
	end

	if hp1 < 1 then hp1 = 0
	end

	if hp1 == 0 then
		k = true
	end

	if hp == 0 then
		k1 = true
	end

	if hp == 0 then
		speed = 0
		speed1 =  0
	end

	if hp1 == 0 then
		speed1 = 0
		speed = 0
	end
	if hp == 0 or hp1 == 0 then
		time = time - dt
	end

end