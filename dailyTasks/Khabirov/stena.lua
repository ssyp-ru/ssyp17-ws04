--ставит стену с x,y начала. ширина и высота
function stena(decoration, x_, y_, w, h, decorationType)
	for y = y_, y_ + h - 1 do
		for x = x_, x_ + w - 1 do
			decoration[#decoration+1] = {type = decorationType or "wall", x = x, y = y}
		end
	end
	love.graphics.setColor(255, 255, 0)
end

--ставит стены вокруг уровня
function granitsy(decoration, w, h)
	stena(decoration, 0, 0, w, 1, "wall")
	stena(decoration, 0, 1, 1, h - 1, "wall")
	stena(decoration, 1, h - 1, w - 1, 1, "wall")
	stena(decoration, w - 1, 1, 1, h - 2, "wall" )
end