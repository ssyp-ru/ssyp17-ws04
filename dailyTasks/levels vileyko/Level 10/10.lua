--Level 10 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 2, y = 18}
decoration[#decoration+1] = {type = "B", x = 3, y = 3}
decoration[#decoration+1] = {type = "R", x = 17, y = 17}

stena (decoration, 1, 16, 11, 1)
stena (decoration, 15, 13, 1, 7)
stena (decoration, 3, 13, 12, 1)
stena (decoration, 15, 12, 3, 1)
stena (decoration, 18, 15, 2, 1)
stena (decoration, 1, 10, 11, 1)
stena (decoration, 16, 10, 3, 1)
stena (decoration, 16, 5, 4, 1)
stena (decoration, 5, 4, 1, 2)
stena (decoration, 8, 1, 1, 5)
stena (decoration, 11, 3, 1, 3)
stena (decoration, 15, 1, 1, 2)

stena (decoration, 1, 8, 18, 1, "noplayer")

granitsy(decoration, 20, 20)

return decoration