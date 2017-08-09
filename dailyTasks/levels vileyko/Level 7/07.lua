--Level 07 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 9, y = 17}
decoration[#decoration+1] = {type = "B", x =3, y = 4}
decoration[#decoration+1] = {type = "R", x = 15, y = 17}

stena (decoration, 7, 15, 1, 4)
stena (decoration, 12, 17, 1, 3)
stena (decoration, 1, 1, 6, 1)
stena (decoration, 1, 5, 1, 3)
stena (decoration, 4, 2, 4, 1)
stena (decoration, 1, 9, 9, 1)
stena (decoration, 3, 6, 1, 2)
stena (decoration, 6, 6, 1, 2)
stena (decoration, 8, 4, 1, 4)
stena (decoration, 8, 2, 1, 2)
stena (decoration, 12, 5, 1, 4)
stena (decoration, 13, 2, 7, 1)
stena (decoration, 14, 5, 3, 1)
stena (decoration, 15, 7, 3, 1)
stena (decoration, 12, 9, 7, 1)
stena (decoration, 12, 15, 7, 1)
stena (decoration, 17, 16, 1, 2)

stena (decoration, 1, 12, 18, 1, "noplayer")

granitsy(decoration, 20, 20)

return decoration