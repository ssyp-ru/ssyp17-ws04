local VirtualOutput = class('VirtualOutput', Connector)

function VirtualOutput:initialize(parent) 
  Connector.initialize(self, -666, -666, parent)
  
  local name = CONSTANTS.connector.types.output
  local subclass = CONSTANTS.connector.subclasses.noSubclass
  self:setName(name)
  self:setSubclass(subclass)
  
  self.connections = {}
end

function VirtualOutput:save(file)
end
function VirtualOutput:isolate()
end
function VirtualOutput:move(x, y)
end
function VirtualOutput:removeInput(input)
end
function VirtualOutput:createConnection(input) 
end
function VirtualOutput:connect(input) 
end
function VirtualOutput:drawConnections()
end
function VirtualOutput:draw()
end
return VirtualOutput