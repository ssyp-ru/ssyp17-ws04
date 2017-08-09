local Element = class('Element', Object)

function Element:initialize(x, y, inputs, isMovable) 
  local subclass = CONSTANTS.element.subclasses.noSubclass
  local name = CONSTANTS.element.types.noType
  local size = CONSTANTS.element.size
  local connectorSize = CONSTANTS.connector.size
  
  Object.initialize(self, x, y, size, size, subclass, name, false)
  self.w = self.w + connectorSize
  self.h = self.h + connectorSize
  
  self:initConnectors(inputs)
end
function Element:initConnectors(inputs) 
  self.outputValue = 0
  self.output = Output:new(self.x, self.y, self)
  
  self.inputs = {}
  for i = 1, inputs do
    self.inputs[i] = Input:new(self.x, self.y, self)
  end
end
function Element:save(file)
  file:write('element:\n')
  
  file:write('element.x:'..self.x..'\n')
  file:write('element.y:'..self.y..'\n')
  
  file:write('element.inputs:')
  for i = 1, #self.inputs do
    self.inputs[i]:save(file)
  end
  file:write('\n')
  
  file:write('element.output:')
  self.output:save(file)
  
  file:write('\n')
end

function Element:move(x, y)
  local difx = self.x - self.output.x
  local dify = self.y - self.output.y
  
  self.output:move(x - difx, y - dify)
  
  for i = 1, #self.inputs do
    difx = self.x - self.inputs[i].x
    dify = self.y - self.inputs[i].y
    
    self.inputs[i]:move(x - difx, y - dify)
  end
  
  self.x = x
  self.y = y
end
function Element:update() 
  print('update')
end
--
function Element:getConnector(x, y)
  if self.output:check(x, y) then
    return self.output
  
  else 
    for i = 1, #self.inputs do
      if self.inputs[i]:check(x, y) then
        return self.inputs[i]
      end
    end
  end
end
function Element:getOutput()
  return self.outputValue
end
function Element:isolate()
  self.output:isolate()
  
  for i = 1, #self.inputs do
    self.inputs[i]:isolate()
  end
end

function Element.static.connect(connector1, connector2)
  connector1:createConnection(connector2)
end

function Element:checkConnectionsDirty() 
	for i = 1, #self.inputs do
		local cur = self.inputs[i]
    
    if cur.connection then
			if self.inputs[i].connection.parent:getDirty() then
				return true
			end
		end
	end
	
	return false
end

function Element:checkConnectionsOutput() 
	local result = {}
	
	for i = 1, #self.inputs do
		if self.inputs[i].connection then
			result[#result + 1] = self.inputs[i].connection.parent:getOutput()
		else 
      result[#result + 1] = 0
    end
	end
	
	return result
end
--
function Element:drawConnections()
  self.output:drawConnections()
end
function Element:draw() 
  self.sprite:draw(self.x, self.y, 0)
  
  for i = 1, #self.inputs do
    self.inputs[i]:draw()
  end

  self.output:draw()
end

return Element