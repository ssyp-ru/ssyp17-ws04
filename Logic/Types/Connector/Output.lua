local Output = class('Output', Connector)

function Output:initialize(x, y, parent) 
  Connector.initialize(self, x, y, parent)
  self.connections = {}
  
  self.sprite = Sprite:new(CONSTANTS.connector.size, CONSTANTS.connector.size, CONSTANTS.connector.paths.output)
  self.description = Description:new(CONSTANTS.connector.subclasses.noSubclass, CONSTANTS.connector.types.output, false)
end

function Output:createConnection(input) 
  self:connect(input)
  input:connect(self)
end

function Output:connect(input) 
  self.connections[#self.connections + 1] = input
end

return Output