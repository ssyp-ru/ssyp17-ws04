local Input = class('Input', Connector)

function Input:initialize(x, y, parent) 
  Connector.initialize(self, x, y, parent)
  self.connection = nil
  
  self.sprite = Sprite:new(CONSTANTS.connector.size, CONSTANTS.connector.size, CONSTANTS.connector.paths.input)
  self.description = Description:new(CONSTANTS.connector.subclasses.noSubclass, CONSTANTS.connector.types.input, false)
end

function Input:createConnection(output)
  self:connect(output)
  output:connect(self)
end
  
function Input:connect(output) 
  self.connection = output
end

return Input