local Sprite = class('Sprite')

function Sprite:initialize(w, h)
  self.states = {}
  self.state = 'none'
  
  self.w = w
  self.h = h
end

function Sprite:loadState(stateName, path)
  self.states[stateName] = love.graphics.newImage(path)
end
--
function Sprite:getState()
  return self.state
end
function Sprite:getWidth()
  return self.w
end
function Sprite:getHeight()
  return self.h
end

--
function Sprite:setState(state)
  self.state = state
end
--
function Sprite:draw(x, y, rotate) 
  local state = self.states[self.state]
  
  local scalex = findRate(self.w, state:getWidth()) 
  local scaley = findRate(self.h, state:getHeight())
  
  local ox = self.w / (2 * scalex)
  local oy = self.h / (2 * scaley)
  
  love.graphics.draw(state, x, y, rotate, scalex, scaley, ox, oy)
end

--
function findRate(standart, real)
  return standart / real
end

--
return Sprite