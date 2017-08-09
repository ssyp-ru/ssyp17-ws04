CONSTANTS = {}

local prefix = '/logic' -- paths
CONSTANTS.prefix = 'logic.' -- require modules

-- Editor consts --
CONSTANTS.editor = {}
CONSTANTS.editor.editMode = 
{
  BEGIN = 0,
  MANIPULATEWIRES = 1,
  MANIPULATEELEMENTS = 2,
  ADDLOGICAND = 3,
  ADDLOGICOR = 4,
  ADDROOTGENERATOR = 5,
  ADDACTION = 6,
  END = 7
}

CONSTANTS.editor.keyState = { pressed = 'pressed', unpressed = 'unpressed' }
CONSTANTS.editor.mouse = { left = 1, right = 2 }

CONSTANTS.editor.keys = 
{
  swapEditModeLeft = 'left',
  swapEditModeRight = 'right',
  addElement = ''
}

-- Scheme consts --
CONSTANTS.scheme = {}
CONSTANTS.scheme.size = 10
CONSTANTS.scheme.space = 0

-- Element consts -- 
CONSTANTS.element = {}
CONSTANTS.element.size = 100

CONSTANTS.element.paths = 
{
  logicAnd = prefix .. '/res/and.png',
  logicOr = prefix .. '/res/or.png',
  rootGenerator = prefix .. '/res/generator.png',
  actionAction = prefix .. '/res/action.png'
}

CONSTANTS.element.subclasses = 
{
  noSubclass = 'Element',
  root = 'RootElement',
  logic = 'LogicElement',
  action = 'ActionElement'
}

CONSTANTS.element.types = 
{
  noType = '-',
  logicAnd = 'And',
  logicOr = 'Or',
  logicNot = 'Not',
  rootGenerator = 'Generator',
  actionAction = 'Action'
}

-- Connector consts --
CONSTANTS.connector = {}
CONSTANTS.connector.size = 30

CONSTANTS.connector.paths = 
{
  input = prefix .. '/res/input.png',
  output = prefix .. '/res/output.png'
}

CONSTANTS.connector.subclasses = 
{
  noSubclass = 'Connector'
}

CONSTANTS.connector.types = 
{
  noType = '-',
  input = 'Input',
  output = 'Output'
}

CONSTANTS.sprite = {}
CONSTANTS.sprite.states = 
{
  default = 'default'
}

return CONSTANTS