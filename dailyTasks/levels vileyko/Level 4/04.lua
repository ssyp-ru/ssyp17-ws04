--Level 04 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 2, y = 15}
decoration[#decoration+1] = {type = "B", x = 2, y = 2}

stena (decoration, 1, 7, 6, 1)
stena (decoration, 2, 4, 7, 1)
stena (decoration, 4, 1, 5, 1)
stena (decoration, 9, 1, 1, 7)
stena (decoration, 4, 10, 1, 6)
stena (decoration, 1, 12, 3, 1)
stena (decoration, 4, 16, 6, 1)
stena (decoration, 7, 10, 1, 3)
stena (decoration, 8, 10, 3, 1)
stena (decoration, 7, 13, 6, 1)
stena (decoration, 13, 6, 7, 1)
stena (decoration, 13, 7, 1, 12)

granitsy(decoration, 20, 20)

return decoration