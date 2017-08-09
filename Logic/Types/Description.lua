local Description = class('Description')

function Description:initialize(subclass, name, isMovable) 
  self.name = name
  self.subclass = subclass
  
  self.isMovable = isMovable
  self.isDirty = true
end

function Description:draw(x, y)
  local str = 'Subclass: ' .. self.subclass .. '\n' 
              .. 'Name: ' .. self.name .. '\n' 
              .. 'Movable: ' .. boolToString(self.isMovable) .. '\n' 
              .. 'Dirty: ' .. boolToString(self.isDirty) .. '\n'
  love.graphics.print(str, x, y)
end

return Description