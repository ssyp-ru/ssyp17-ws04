--Level 01  20x20
require("../stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 6, y = 13 }

decoration[#decoration+1] = {type = "B", x = 6, y = 3}
love.graphics.print("B", 6, 3)

stena(decoration, 4, 7, 6, 1)
stena(decoration, 10, 2, 1, 6)
love.graphics.print("A", 40, 75)
				love.graphics.print("B", 40, 25)
granitsy(decoration, 20, 20)

return decoration