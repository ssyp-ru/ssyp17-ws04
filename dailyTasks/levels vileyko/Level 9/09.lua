--Level 09 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 1, y = 19}
decoration[#decoration+1] = {type = "B", x = 19, y = 1}
decoration[#decoration+1] = {type = "R", x = 3, y = 5}

stena (decoration, 8, 1, 1, 8)
stena (decoration, 3, 1, 1, 6)
stena (decoration, 6, 6, 2, 1)
stena (decoration, 2, 8, 6, 1)
stena (decoration, 2, 11, 5, 1)
stena (decoration, 2, 13, 1, 6)
stena (decoration, 5, 16, 2, 1)
stena (decoration, 7, 11, 1, 9)
stena (decoration, 11, 11, 1, 8)
stena (decoration, 12, 11, 6, 1)
stena (decoration, 12, 16, 2, 1)
stena (decoration, 17, 13, 1, 7)
stena (decoration, 12, 8, 6, 1)
stena (decoration, 11, 1, 1, 8)
stena (decoration, 12, 6, 2, 1)
stena (decoration, 16, 1, 1, 6)


stena (decoration, 8, 8, 3, 1, "noplayer")

granitsy(decoration, 20, 20)

return decoration