Editor = class('Editor')

function Editor:initialize()
  self.scheme = Scheme:new(CONSTANTS.scheme.size)
  
  self.keys = {}
  self.points = {}
  self:patternInit()
  
  self.editMode = CONSTANTS.editor.editMode.ADDLOGICAND
end

function Editor:save(path)
  file = io.open(path, 'w')
  if file ~= nil then
    self.scheme:save(file)
    file:flush()
  end
  file:close()
end
function Editor:patternInit()
  types = CONSTANTS.element.types
  self.elementsPattern = {}
  
  self.elementsPattern[types.logicAnd] = 50
  self.elementsPattern[types.logicOr] = 50
  self.elementsPattern[types.logicNot] = 50
  
  self.elementsPattern[types.rootGenerator] = 50
  
  self.elementsPattern[types.actionAction] = 50
end
--
function Editor:addPoint(x, y, button)
  self.points[#self.points + 1] = Point:new(x, y, button)
end
function Editor:cleanPoints()
  self.points = {}
end
function Editor:showPoints()
  print('MOUSE POINTS [' .. #self.points .. ']')
  for i = 1, #self.points do
    print('point ' .. i .. '  x:' .. self.points[i].x .. '  y:' .. self.points[i].y .. '  but:', self.points[i].button)
  end
end
--
function Editor:onKeyDown(key)
  self.keys[key] = CONSTANTS.editor.keyState.pressed
end

function Editor:onKeyUp(key)
  self.keys[key] = CONSTANTS.editor.keyState.unpressed
end

function Editor:onMouseDown(x, y, button)
  self:addPoint(x, y, button)
end
function Editor:onMouseUp(x, y, button)
  self:addPoint(x, y, button)
end
--
function Editor:swapEditModeLeft()
  self:cleanPoints()
  self.editMode = self.editMode - 1
  
  local modes = CONSTANTS.editor.editMode
  
  if self.editMode == modes.BEGIN then
    self.editMode = modes.END - 1
  end
end

function Editor:swapEditModeRight() 
  self:cleanPoints()
  self.editMode = self.editMode + 1 

  local modes = CONSTANTS.editor.editMode

  if self.editMode == modes.END then
    self.editMode = modes.BEGIN + 1
  end
end
--
function Editor:lastClick(button)
  if self.points[#self.points].button == button then
    return true
  end
end
--
function Editor:addElement(class)
  local mouse = CONSTANTS.editor.mouse
  
  if self:lastClick(mouse.left) then
    local x = self.points[2].x 
    local y = self.points[2].y
    local element = class:new(x, y, true)
    
    if self.elementsPattern[element:getName()] > 0 then
      
      self.elementsPattern[element:getName()] = self.elementsPattern[element:getName()] - 1
      self.scheme:addElement(element)
    end
  end
end
function Editor:addLogicAnd()
  self:addElement(And)
end
function Editor:addLogicOr()
  self:addElement(Or)
end
function Editor:addRootGenerator()
  self:addElement(Generator)
end
function Editor:addAction()
  self:addElement(Action)
end
--
function Editor:removeElement()
  local x = self.points[2].x
  local y = self.points[2].y
  local element = self.scheme:getElement(x, y)
  
  if element then
    local type = element:getName()

    self.elementsPattern[type] = self.elementsPattern[type] + 1
    self.scheme:removeElement(element)
  end
end
function Editor:pullElement()
  local x1 = self.points[1].x
  local y1 = self.points[1].y
  
  local x2 = self.points[2].x
  local y2 = self.points[2].y
  
  local element = self.scheme:getElement(x1, y1)
  
  if element then
    self.scheme:moveElement(element, x2, y2)
  end
end
function Editor:manipulateElements()
  local mouse = CONSTANTS.editor.mouse
  
  if self:lastClick(mouse.left) then
    self:pullElement()
  else 
    self:removeElement()
  end
end
--
function Editor:addConnection()
  local x1 = self.points[1].x
  local y1 = self.points[1].y
  
  local x2 = self.points[2].x
  local y2 = self.points[2].y
  
  local connector1 = self.scheme:getConnector(x1, y1)
  local connector2 = self.scheme:getConnector(x2, y2)
    
  if connector1 and connector2 then
    self.scheme:addConnection(connector1, connector2)
  end    
end
function Editor:removeConnection()
  local x = self.points[2].x
  local y = self.points[2].y
  local connector = self.scheme:getConnector(x, y)
    
  if connector then
    connector:isolate()
  end
end
function Editor:manipulateConnections()
  local mouse = CONSTANTS.editor.mouse
  
  if self:lastClick(mouse.left) then
      self:addConnection()
    else 
      self:removeConnection()
    end
end
--
function Editor:mouseAction()
  local editMode = CONSTANTS.editor.editMode
 
  if self.editMode == editMode.MANIPULATEWIRES then
    self:manipulateConnections()
    
  elseif self.editMode == editMode.MANIPULATEELEMENTS then
    self:manipulateElements()
  
  elseif self.editMode == editMode.ADDLOGICAND then
    self:addLogicAnd()
  
  elseif self.editMode == editMode.ADDLOGICOR then 
    self:addLogicOr()
  
  elseif self.editMode == editMode.ADDROOTGENERATOR then
    self:addRootGenerator()
     
  elseif self.editMode == editMode.ADDACTION then
    self:addAction()
    
  end
end

function Editor:keyboard()
  local state = CONSTANTS.editor.keyState
  local keys = CONSTANTS.editor.keys
  
  if self.keys[keys.swapEditModeLeft] == state.pressed then
    self:swapEditModeLeft()
    self.keys[keys.swapEditModeLeft] = state.unpressed
  
  elseif self.keys[keys.swapEditModeRight] == state.pressed then
    self:swapEditModeRight()
    self.keys[keys.swapEditModeRight] = state.unpressed
    
  elseif self.keys['space'] == state.pressed then 
    self:save('test.txt')
    self.keys['space'] = state.unpressed
    
  elseif self.keys['s'] == state.pressed then
    self.scheme:update()
    self.keys['s'] = state.unpressed
  
    print('UPDATE')
    for i = 1, #self.scheme.elements do
      print('element', self.scheme.elements[i], self.scheme.elements[i].outputValue)
      res = self.scheme.elements[i]:checkConnectionsOutput()
      
      for i = 1, #res do
        print('--', res[i])
      end
    end
    print('\n')
    
    local actions = self.scheme:getActions()
    for i = 1, #actions do
      print(actions[i])
    end
    
    print('--------')
    
    self.scheme:dirty()
  end
end

function Editor:mouse()
  if #self.points == 2 then
      self:mouseAction()
    self:cleanPoints()
  end
end
function Editor:action() 
  self:keyboard()
  self:mouse()
end
--
function Editor:showInfo()
  local str = 'EDIT MODE: ' .. self.editMode
  love.graphics.print(str, 0, 0, 0, 1.5)
end
function Editor:drawScheme()
  self.scheme:drawElements()
  self.scheme:drawConnections()
  self.scheme:drawDescriptions()
end

--
return Editor