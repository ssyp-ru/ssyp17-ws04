--Level 03 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 3, y = 16}
decoration[#decoration+1] = {type = "B", x = 17, y = 2}

stena (decoration, 6, 13, 1, 6)
stena (decoration, 1, 6, 6, 1)
stena (decoration, 6, 9, 6, 1)
stena (decoration, 11, 13, 1, 6)
stena (decoration, 9, 1, 1, 6)
stena (decoration, 13, 4, 6, 1)
stena (decoration, 14, 13, 5, 1)

granitsy(decoration, 20, 20)

return decoration