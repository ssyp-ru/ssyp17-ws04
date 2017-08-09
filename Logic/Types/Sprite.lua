local Sprite = class('Sprite')

--!RE
function Sprite:initialize(w, h, path)
  self.pict = love.graphics.newImage(path)

  self.w = w
  self.h = h
end

function Sprite:findRate(standart, real) 
  return standart / real
end

function Sprite:draw(x, y, rotate) 
  local scalex = self:findRate(self.w, self.pict:getWidth()) 
  local scaley = self:findRate(self.h, self.pict:getHeight())
  
  love.graphics.draw(self.pict, x, y, rotate, scalex, scaley, self.w / (2 * scalex), self.h / (2 * scaley))
end

return Sprite