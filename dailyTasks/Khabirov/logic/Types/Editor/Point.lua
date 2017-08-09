Point = class('Point')

function Point:initialize(x, y, button)
  self.x = x
  self.y = y
  self.button = button
end

return Point