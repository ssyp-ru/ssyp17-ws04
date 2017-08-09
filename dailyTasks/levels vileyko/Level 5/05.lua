--Level 05 20x20 
require("stena")

local decoration = {}
decoration[#decoration+1] = {type = "A", x = 2, y = 17}
decoration[#decoration+1] = {type = "B", x = 17, y = 2}

stena (decoration, 1, 15, 3, 1)
stena (decoration, 1, 7, 3, 1)
stena (decoration, 4, 1, 1, 5)
stena (decoration, 4, 9, 1, 5)
stena (decoration, 4, 17, 1, 2)
stena (decoration, 6, 15, 5, 1)
stena (decoration, 5, 7, 5, 1)
stena (decoration, 10, 17, 1, 3)
stena (decoration, 17, 16, 1, 4)
stena (decoration, 10, 9, 1, 4)
stena (decoration, 9, 1, 1, 5)
stena (decoration, 12, 14, 4, 1)
stena (decoration, 12, 4, 1, 4)
stena (decoration, 14, 4, 4, 1)
stena (decoration, 15, 6, 4, 1)
stena (decoration, 15, 8, 1, 4)
stena (decoration, 13, 1, 1, 2)
stena (decoration, 17, 11, 2, 1)


granitsy(decoration, 20, 20)

return decoration