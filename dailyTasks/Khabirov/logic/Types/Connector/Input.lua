local Input = class('Input', Connector)

function Input:initialize(x, y, parent) 
  Connector.initialize(self, x, y, parent)
  
  local name = CONSTANTS.connector.types.input
  local subclass = CONSTANTS.connector.subclasses.noSubclass
  self:setName(name)
  self:setSubclass(subclass)
  
  local path = CONSTANTS.connector.paths.input
  local state = CONSTANTS.sprite.states.default
  self:loadSpriteState(state, path)
  self:setSpriteState(state)

  self.connection = nil
end

function Input:save(file)
  file:write('input:\n')
  
  file:write('input.x'..self.x..'\n')
  file:write('input.y'..self.y..'\n')
  
  file:write('connection:\n')
  if self.connection then
    pair = self.connection:getCoords()
    file:write('connection.x:'..pair.x..'\n')
    file:write('connection.y:'..pair.y..'\n')
  end
  file:write()
end
function Input:isolate()
  if self.connection then
    
    self.connection:removeInput(self)
    self.connection = nil
  end
end
function Input:createConnection(output)
  if self.connection then
    self.connection:removeInput(self)
  end

  self:connect(output)
  output:connect(self)
end
function Input:connect(output) 
  self.connection = output
end

return Input