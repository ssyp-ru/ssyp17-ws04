Action = class('Action', Element)

function Action:initialize(x, y, isMovable) 
  Element.initialize(self, x, y, 1, isMovable)
  
  local name = CONSTANTS.element.types.actionAction
  local subclass = CONSTANTS.element.subclasses.action
  self:setName(name)
  self:setSubclass(subclass)
  
  local path = CONSTANTS.element.paths.actionAction
  local state = CONSTANTS.sprite.states.default
  self:loadSpriteState(state, path)
  self:setSpriteState(state)
  
  self:initConnectors()
end

function Action:initConnectors()
  local spriteWidth = self:getSpriteWidth()
  local leftX = self.x - spriteWidth / 2
  local rightX = self.x + spriteWidth / 2
  local centerY = self.y
  
  self.inputs = {}
  self.inputs[1] = Input:new(leftX, centerY, self)
  self.output = VirtualOutput:new(self)
end

function Action:update()
  self:setDirty(false)
  local input = self:checkConnectionsOutput()
  
  if input[1] == 1 then
    self.outputValue = 1
  else 
    self.outputValue = 0
  end
end
--
return Action