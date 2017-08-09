--Level 06 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 4, y = 16}
decoration[#decoration+1] = {type = "B", x = 14, y = 3}
decoration[#decoration+1] = {type = "R", x = 3, y = 5}

stena (decoration, 9, 8, 1, 7)
stena (decoration, 9, 1, 1, 7, "noplayer")
stena (decoration, 9, 15, 1, 4, "noplayer")
granitsy (decoration, 20, 20)

return decoration