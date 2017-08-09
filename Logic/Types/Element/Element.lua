local Element = class('Element')

function Element:initialize(x, y, inputs, isMovable) 
  
  self.x = x
  self.y = y
    
  self.outputValue = 0
  self.output = Output:new(x, y, self)
  
  self.inputs = {}
  for i = 1, inputs do
    self.inputs[i] = Input:new(x, y, self)
  end
  
  self.description = Description:new(CONSTANTS.element.subclasses.noSubclass, CONSTANTS.element.types.noType, isMovable)
  self.sprite = nil
end

function Element:move(x, y)
  local difx = x - self.x
  local dify = y - self.y
  
  self.x = x
  self.y = y
  self.output.x = self.output.x + difx
  self.output.y = self.output.y + dify
  
  for i = 1, #self.inputs do
    self.inputs[i].x = self.inputs[i].x + difx
    self.inputs[i].y = self.inputs[i].y + dify
  end
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
function Element.static.connect(connector1, connector2)
  connector1:createConnection(connector2)
end
--
function Element:check(x, y) 
  if x > self.x - CONSTANTS.element.size / 2 - CONSTANTS.connector.size / 2 and
    x < self.x + CONSTANTS.element.size / 2 + CONSTANTS.connector.size / 2 and
    y > self.y - CONSTANTS.element.size / 2 - CONSTANTS.connector.size / 2 and
    y < self.y + CONSTANTS.element.size / 2 + CONSTANTS.connector.size / 2 then
        
    return true
  end
end
function Element:checkConnectionsDirtyness() 
	for i = 1, #self.inputs do
		if self.inputs[i].connection then
			if self.inputs[i].connection.parent:getDirtyness() then
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
			result[#result + 1] = self.inputs[i].connection.parent.outputValue
		else 
      result[#result + 1] = 0
    end
	end
	
	return result
end


--
function Element:dirty()
  self.description.isDirty = true
end
function Element:clean() 
  self.description.isDirty = false
end
function Element:getDirtyness() 
  return self.description.isDirty
end
--
function Element:getName() 
  return self.description.name
end

function Element:getSubclass() 
  return self.description.subclass
end
function Element:getMovable() 
  return self.description.isMovable
end
--
function Element:draw() 
  self.sprite:draw(self.x, self.y, 0)
  
  for i = 1, #self.inputs do
    self.inputs[i]:draw()
  end
  self.output:draw()
end

function Element:drawDescription() 
  self.description:draw(self.x + CONSTANTS.element.size / 2, self.y, 1)
end
return Element