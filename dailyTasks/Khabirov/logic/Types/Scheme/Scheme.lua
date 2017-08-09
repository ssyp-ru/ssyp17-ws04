Scheme = class('Scheme')

function Scheme:initialize(size)
  self.size = size
  self.elements = {}
end

function Scheme:save(file)
  file:write('schemeSize:'..self.size..'\n')
  for i = 1, #self.elements do
    self.elements[i]:save(file)
  end
end

function Scheme:update()
  local notDirtyCounter = 0
  
  while notDirtyCounter < #self.elements do 

    for element = 1, #self.elements do
      local cur = self.elements[element]
      local ready = not cur:checkConnectionsDirty()
      
      if ready then
        cur:update()
        notDirtyCounter = notDirtyCounter + 1
      end
    end
  end
end

function Scheme:dirty()
  for i = 1, #self.elements do
    self.elements[i]:setDirty(true)
  end
end
--
function Scheme:correctPosition(element)
  local size = element:getWidth() + CONSTANTS.scheme.space
  local elementCoords = element:getCoords()
  
  local x = elementCoords.x - elementCoords.x % size + size / 2
  local y = elementCoords.y - elementCoords.y % size + size / 2
  
  element:move(x, y)
  correct(element)
end

function Scheme:addElement(element)
  for i = 1, #self.elements do
    if self.elements[i]:check(element.x, element.y) then
      return
    end
  end
  
  self:correctPosition(element)
  self.elements[#self.elements + 1] = element
end
function Scheme:moveElement(element, x, y)
  for i = 1, #self.elements do
    if self.elements[i]:check(x, y) then
      return
    end
  end
  
  element:move(x, y)
  self:correctPosition(element)
end

function Scheme:addConnection(connector1, connector2) 
  if connector1 and connector2 then
    local types = CONSTANTS.connector.types
    
      if (connector1:getName() == types.input and
      connector2:getName() == types.output) or 
      (connector1:getName() == types.output and
      connector2:getName() == types.input) then
      
        Element.connect(connector1, connector2)
      end
  end
end
function Scheme:removeElement(element)
  local elementCoords = element:getCoords()
  local length = #self.elements
  
  for i = 1, length do
    curCoords = self.elements[i]:getCoords()
    
    if elementCoords.x == curCoords.x and elementCoords.y == curCoords.y then
      self.elements[i]:isolate()
      self.elements[i] = self.elements[length]
      self.elements[length] = nil
      
      break
    end
  end
end
function Scheme:getActions()
  actions = {}
  
  for i = 1, #self.elements do
    local cur = self.elements[i]
    local action = CONSTANTS.element.subclasses.action
    
    if cur:getSubclass() == action and cur:getOutput() == 1 then
      actions[#actions + 1] = cur:getName()
    end
  end
  
  return actions
end
function Scheme:getElement(x, y)
  for i = 1, #self.elements do
    if self.elements[i]:check(x, y) then
      return self.elements[i]
    end
  end
end
function Scheme:getConnector(x, y)
  element = self:getElement(x, y)
  if element then
    return element:getConnector(x, y)
  end
end
--
function Scheme:drawConnections() 
  for element = 1, #self.elements do
    self.elements[element]:drawConnections()
  end
end

function Scheme:drawElements() 
  for i = 1, #self.elements do
    self.elements[i]:draw()
  end
end

function Scheme:drawDescriptions() 
    for i = 1, #self.elements do
      self.elements[i]:drawDescription()
    end
end

--
function correct(element)
  local size = element:getWidth() + CONSTANTS.scheme.space
  local elementCoords = element:getCoords()
  local x = elementCoords.x
  local y = elementCoords.y
  
  local bottomPartX = ((x - size / 2) % size) / size
  local upperPartX = 1 - bottomPartX
  
  local bottomPartY = ((y - size / 2) % size) / size
  local upperPartY = 1 - bottomPartY
  
  if bottomPartX > upperPartX then
    x = x + size
  end
  
  if bottomPartY > upperPartY then
    y = y + size
  end
  
  element:move(x, y)
end
return Scheme