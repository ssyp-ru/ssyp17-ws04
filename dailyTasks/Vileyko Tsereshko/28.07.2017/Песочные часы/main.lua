function love.load ()
	x = 385
	y = 200
	x1 = math.random(400, 450)
	y1 = math.random(200, 300)
--	x2 = math.random(350, 485)
--	y2 = math.random(220, 280)
	r = 2
end
math.randomseed(os.time())
function love.draw()
	for i = 1, 50 do
		love.graphics.setColor(0, 255, 255)
		love.graphics.circle("fill", x1, y1, r)
		print(x1, y1)
	end
	love.graphics.setColor(255, 255, 0)
		love.graphics.rectangle("line", x, y, 100, 100)
end

function love.update (dt)
--	oldx1 = x1
--	oldy1 = y1
--	oldx2 = x2
--	oldy2 = y2
--	if math.sqrt(((x1-x2)*(x1-x2))+(y1-y2)*(y1-y2)) < r+r then 
--		x1 = oldx1
--		y1 = oldy1
--		x2 = oldx2
--		y2 = oldy2 

--	end
end