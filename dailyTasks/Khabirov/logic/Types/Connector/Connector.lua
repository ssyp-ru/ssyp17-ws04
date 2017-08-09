local Connector = class('Connector', Object)

--[[
  1. connector doesn't exist without parent
]]

function Connector:initialize(x, y, parent) 
  local subclass = CONSTANTS.connector.subclasses.noSubclass
  local name = CONSTANTS.connector.types.noType
  local size = CONSTANTS.connector.size
  
  Object.initialize(self, x, y, size, size, subclass, name, false)
  self.parent = parent
end
function Connector:isolate()
  print('isolate')
end

return Connector