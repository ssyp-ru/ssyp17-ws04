function love.load()
	robot = {
		x = 0,
		y = 438 ,
		speed = 250,
		image = love.graphics.newImage("img/rob.png"),
		w = 1,
		h = 1
	}
	robot.w, robot.h = robot.image:getDimensions()

	xworld = 0
	yworld = 500
	prepyat = {
		x = 200,
		y = 470 ,
		speed = 100,
		image = love.graphics.newImage("img/lur.png")
	}
	prepyat.w, prepyat.h = prepyat.image:getDimensions()

	world = love.graphics.newImage("img/polo.png")
end



function love.draw()
	love.graphics.draw(world, xworld, yworld)
	love.graphics.draw(robot.image, robot.x, robot.y)
	love.graphics.draw(prepyat.image, prepyat.x, prepyat.y)
end

function neHodiZaEkran(o)
	if o.x < 0 then
		o.x = 0
	end
	if o.x > love.graphics.getWidth() - o.w then
		o.x = love.graphics.getWidth() - o.w
	end
end


function love.update(dt)
	neHodiZaEkran(robot)
	neHodiZaEkran(prepyat)
	neHodiZaEkran1(robot, prepyat)


	if love.keyboard.isDown("w") then 
		robot.y = 420 - 15 			
	end
	if love.keyboard.isDown("s") then 
		robot.y = 420 + 15  	
	end

	if love.keyboard.isDown("d") then
		robot.x = robot.x + robot.speed * dt
	end	
	if love.keyboard.isDown("a") then
		robot.x = robot.x - robot.speed * dt
	end

	if love.keyboard.isDown("right") then
		prepyat.x = prepyat.x + prepyat.speed * dt
	end	
	if love.keyboard.isDown("left") then
		prepyat.x = prepyat.x - prepyat.speed * dt
	end
end

function neHodiZaEkran1(r, p)
	if r.x > p.x - r.w and 
	((r.y > p.y and 
			r.y < p.y + p.h and
			r.y + r.h > p.y and
			r.y + r.h < p.y + p.h) or

		( r.y > p.y and
			r.y < p.y + p.h and
			r.y + r.h > p.y and
			r.y + r.h < p.y + p.h)) then
		p.x = p.x - r.w - 1
	end

	if r.x > p.x - r.w then
		r.x = p.x - r.w
	end

end





