local Output = class('Output', Connector)

function Output:initialize(x, y, parent) 
  Connector.initialize(self, x, y, parent)
  
  local name = CONSTANTS.connector.types.output
  local subclass = CONSTANTS.connector.subclasses.noSubclass
  self:setName(name)
  self:setSubclass(subclass)
  
  local path = CONSTANTS.connector.paths.output
  local state = CONSTANTS.sprite.states.default
  self:loadSpriteState(state, path)
  self:setSpriteState(state)
  
  self.connections = {}
end

function Output:save(file)
  file:write('output:\n')
  
  file:write('output.x:'..self.x..'\n')
  file:write('output.y:'..self.y..'\n')
  
  file:write('connections:\n')
  for i = 1, #self.connections do
    pair = self.connections[i]:getCoords()
    file:write('connection'..i..'.x:'..pair.x..'\n')
    file:write('connection'..i..'.y:'..pair.y..'\n')
  end
end
function Output:isolate()
  --
  for i = 1, #self.connections do
    self.connections[i].connection = nil
  end
  
  self.connections = {}
end
function Output:removeInput(input)
  local inputCoords = input:getCoords()
  local length = #self.connections
  
  for i = 1, length do
    local curCoords = self.connections[i]:getCoords()
    
    if inputCoords.x == curCoords.x and inputCoords.y == curCoords.y then
      
      self.connections[i] = self.connections[length]
      self.connections[length] = nil
      
      break
    end
  end
end
function Output:createConnection(input) 
  input:isolate()
  input:connect(self)
  
  self:connect(input)
end

function Output:connect(input) 
  self.connections[#self.connections + 1] = input
end

function Output:drawConnections()
  for connection = 1, #self.connections do
      local cur = self.connections[connection]
      local curCoords = cur:getCoords()
    
      if cur then
        love.graphics.line(self.x, self.y, curCoords.x, curCoords.y)
      end
    end
end

return Output