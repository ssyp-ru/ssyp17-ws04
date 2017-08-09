--Level 08 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 2, y = 17}
decoration[#decoration+1] = {type = "B", x = 19, y = 1}
decoration[#decoration+1] = {type = "R", x = 19, y = 14}

stena (decoration, 2, 2, 1, 7)
stena (decoration, 2, 10, 1, 6)
stena (decoration, 4, 2, 5, 1)
stena (decoration, 5, 4, 1, 11)
stena (decoration, 4, 17, 10, 1)
stena (decoration, 8, 15, 5, 1)
stena (decoration, 9, 13, 7, 1)
stena (decoration, 15, 15, 1, 2)
stena (decoration, 17, 13, 1, 6)
stena (decoration, 13, 1, 1, 7)
stena (decoration, 15, 1, 1, 4)
stena (decoration, 17, 1, 1, 1)
stena (decoration, 15, 6, 5, 1)
stena (decoration, 17, 3, 2, 1)

stena (decoration, 10, 1, 1, 9, "noplayer")
stena (decoration, 11, 9, 9, 1, "noplayer")

granitsy(decoration, 20, 20)

return decoration