Object = class('Object')

function Object:initialize(x, y, w, h, subclass, name, isMovable) 
  self.x = x
  self.y = y
  self.w = w
  self.h = h
  
  self.sprite = Sprite:new(w, h)
  self.description = Description(subclass, name, isMovable)
end

function Object:move(x, y)
  self.x = x
  self.y = y
end
function Object:loadSpriteState(stateName, path)
  self.sprite:loadState(stateName, path)
end
--
function Object:check(x, y)
  if x > self.x - self.w / 2 and
    x < self.x + self.w / 2 and
    y > self.y - self.h / 2 and
    y < self.y + self.h / 2 then
        
    return true
  end
end
--
function Object:getName()
  return self.description:getName()
end
function Object:getSubclass()
  return self.description:getSubclass()
end

function Object:getMovable()
  return self.description:getMovable()
end
function Object:getDirty()
  return self.description:getDirty()
end
function Object:getWidth()
  return self.w
end
function Object:getHeight()
  return self.h
end
function Object:getCoords()
  return { x = self.x, y = self.y }
end
function Object:getSpriteState()
  return self.sprite:getState()
end
function Object:getSpriteWidth()
  return self.sprite:getWidth()
end
function Object:getSpriteHeight()
  return self.sprite:getHeight()
end
--
function Object:setName(name)
  self.description:setName(name)
end
function Object:setSubclass(subclass)
  self.description:setSubclass(subclass)
end
function Object:setMovable(movable)
  self.description:setMovable(movable)
end
function Object:setDirty(state)
  self.description:setDirty(state)
end
function Object:setSpriteState(state)
  self.sprite:setState(state)
end
--
function Object:draw()
  self.sprite:draw(self.x, self.y, 0)
end
  

function Object:drawDescription()
  local spriteWidth = self:getSpriteWidth()
  self.description:draw(self.x + spriteWidth / 2, self.y)
end
--
return Object