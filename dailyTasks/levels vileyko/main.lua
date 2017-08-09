require ("stena")
lvl01 = require ("level 1/01")
lvl02 = require ("level 2/02")
lvl03 = require ("level 3/03")
lvl04 = require ("level 4/04")
lvl05 = require ("level 5/05")
lvl06 = require ("level 6/06")
lvl07 = require ("level 7/07")
lvl08 = require ("level 8/08")
lvl09 = require ("level 9/09")
lvl10 = require ("level 10/10")


function love.load ()
	levels = {
		lvl01, 
		lvl02, 
		lvl03, 
		lvl04, 
		lvl05, 
		lvl06, 
		lvl07, 
		lvl08, 
		lvl09, 
		lvl10
	}
end

function love.draw()		
	local vpravo = 10
	local vniz = 10
	for i = 1, #levels do
		local decoration = levels[i]
		if i == 6 then
			vniz = vniz + 150
			vpravo = 10
		end
			for j = 1, #decoration do
			if decoration[j].type == "A" then
				love.graphics.print("A", decoration[j].x * 10 + vpravo, decoration[j].y + vniz)
				font = love.graphics.newFont(7)
				love.graphics.setFont(font)
				
			else
				love.graphics.rectangle("line", 
					decoration[j].x * 5 + vpravo, 
					decoration[j].y * 5 + vniz, 5, 5)
			end

			if decoration[j].type == "B" then
				love.graphics.print("B", decoration[j].x + vpravo, decoration[j].y + vniz)
			else
				love.graphics.rectangle("line", 
					decoration[j].x * 5 + vpravo, 
					decoration[j].y * 5 + vniz, 5, 5)
			end
			if decoration[j].type == "R" then
				love.graphics.print("R", decoration[j].x + vpravo, decoration[j].y + vniz)
			else
				love.graphics.rectangle("line", 
					decoration[j].x * 5 + vpravo, 
					decoration[j].y * 5 + vniz, 5, 5)
			end
		end
		vpravo = vpravo + 120
	end
end

function love.update(dt)

end
