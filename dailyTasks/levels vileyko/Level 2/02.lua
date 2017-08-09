--Level 02 20x20

require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 2, y = 12 }
decoration[#decoration+1] = {type = "B", x = 14, y = 3}

stena (decoration, 3, 9, 6, 1)
stena (decoration, 4, 14, 6, 1)
stena (decoration, 5, 2, 1, 5)
stena (decoration, 7, 1, 6, 1)
stena (decoration, 8, 6, 6, 1)
stena (decoration, 14, 8, 1, 8)

granitsy(decoration, 20, 20)

return decoration