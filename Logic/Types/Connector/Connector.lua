local Connector = class('Connector')

function Connector:initialize(x, y, parent) 
  self.x = x
  self.y = y
  
  self.parent = parent
  self.sprite = nil
  self.description = Description(CONSTANTS.connector.subclasses.noSubclass, CONSTANTS.connector.types.noType, false)
end
function Connector:check(x, y) 
  if x > self.x - CONSTANTS.connector.size / 2 and
    x < self.x + CONSTANTS.connector.size / 2 and
    y > self.y - CONSTANTS.connector.size / 2 and
    y < self.y + CONSTANTS.connector.size / 2 then
        
    return true
  end
end

function Connector:getName() 
  return self.description.name
end
function Connector:draw()
  self.sprite:draw(self.x, self.y, 0)
end

return Connector