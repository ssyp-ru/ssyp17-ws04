local Generator = class('Generator', Element)

function Generator:initialize(x, y, isMovable) 
  Element.initialize(self, x, y, 0, isMovable)
  
  local name = CONSTANTS.element.types.rootGenerator
  local subclass = CONSTANTS.element.subclasses.logic
  self:setName(name)
  self:setSubclass(subclass)
  
  local path = CONSTANTS.element.paths.rootGenerator
  local state = CONSTANTS.sprite.states.default
  self:loadSpriteState(state, path)
  self:setSpriteState(state)
  
  self:initConnectors()
  self.signal = 1
end

function Generator:initConnectors()
  local spriteWidth = self:getSpriteWidth()
  local rightX = self.x + spriteWidth / 2
  local centerY = self.y
  
  self.output = Output:new(rightX, centerY, self)
  self.inputs = {}
end

function Generator:update()
  self:setDirty(false)
  self.outputValue = self.signal
end
--
function Generator:getSignal()
  return self.signal
end
--
function Generator:setSignal(signal)
  if signal == 0 then
    self.signal = 0
  else 
    self.signal = 1
  end
end

--
return Generator