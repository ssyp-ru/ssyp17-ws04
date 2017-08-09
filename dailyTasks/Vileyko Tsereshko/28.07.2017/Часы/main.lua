function love.load()	
	x = 385
	y = 100
	r = 90
	x1 = 380
	y1 = 95
	ugolh = math.pi * 2 / 12
	ugolm = math.pi * 2 / 60
	ugols = math.pi * 2 / 60
	t = {ugolh, ugolm, ugols}
end

function love.draw()
	love.graphics.setLineWidth (10)
	love.graphics.setColor(255, 255, 0)
	love.graphics.circle("line", x, y, r)
	love.graphics.setColor(255, 0, 0)
	love.graphics.print("Hours", x1, y1, hour2ugol(h + m / 60))
	love.graphics.setColor(0, 255, 0)
	love.graphics.print("Minutes", x1, y1, minuty2ugol(m))
	love.graphics.setColor(0, 0, 255)
	love.graphics.print("Seconds", x1, y1, secu2ugol(s))
	love.graphics.setColor(255, 255, 255)
end

function minuty2ugol(n)	
	local g = n * math.pi * 2 / 60 - math.pi / 2
	return g
end
function hour2ugol(n)
	local g = n * math.pi * 2 / 12 - math.pi / 2
	return g
end
function secu2ugol(n)	
	local g = n * math.pi * 2 / 60 - math.pi / 2
	return g
end

function love.update(dt)
	h = os.date("%H")
	m = os.date("%M")
	s = os.date("%S")
end