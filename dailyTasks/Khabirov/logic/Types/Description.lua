local Description = class('Description')

function Description:initialize(subclass, name, isMovable) 
  self.name = name
  self.subclass = subclass
  
  self.isMovable = isMovable
  self.isDirty = true
end
--
function Description:getName()
  return self.name
end
function Description:getSubclass()
  return self.subclass
end
function Description:getMovable()
  return self.isMovable
end
function Description:getDirty()
  return self.isDirty
end
--
function Description:setName(name)
  self.name = name
end
function Description:setSubclass(subclass)
  self.subclass = subclass
end
function Description:setMovable(movable)
  self.isMovable = movable
end
function Description:setDirty(state)
  self.isDirty = state
end
--
function Description:draw(x, y)
  local str = 'Subclass: ' .. self.subclass .. '\n' 
              .. 'Name: ' .. self.name .. '\n' 
              .. 'Movable: ' .. boolToString(self.isMovable) .. '\n' 
              .. 'Dirty: ' .. boolToString(self.isDirty) .. '\n'
  love.graphics.print(str, x, y)
end

return Description