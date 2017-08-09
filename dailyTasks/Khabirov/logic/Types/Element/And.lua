local And = class('And', Element)

function And:initialize(x, y, isMovable) 
  Element.initialize(self, x, y, 2, isMovable)
  
  local name = CONSTANTS.element.types.logicAnd
  local subclass = CONSTANTS.element.subclasses.logic
  self:setName(name)
  self:setSubclass(subclass)
  
  local path = CONSTANTS.element.paths.logicAnd
  local state = CONSTANTS.sprite.states.default
  self:loadSpriteState(state, path)
  self:setSpriteState(state)
  
  self:initConnectors()
end

function And:initConnectors()
  local spriteWidth = self:getSpriteWidth()
  local leftX = self.x - spriteWidth / 2
  local rightX = self.x + spriteWidth / 2
  local centerY = self.y
  
  self.inputs = {}
  self.inputs[1] = Input:new(leftX, centerY - 25, self)
  self.inputs[2] = Input:new(leftX, centerY + 25, self)

  self.output = Output:new(rightX, centerY, self)
end

function And:update()
  self:setDirty(false)
  local input = self:checkConnectionsOutput()
  
  for i = 1, #input do
    if input[i] == 0 then
      self.outputValue = 0
      return
    end
  end
  
  self.outputValue = 1
end
return And