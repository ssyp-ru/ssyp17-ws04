CONSTANTS = {}

-- Element consts -- 
CONSTANTS.element = {}
CONSTANTS.element.size = 100

CONSTANTS.element.paths = {}
CONSTANTS.element.paths.logicAnd = '/res/and.png'
CONSTANTS.element.paths.generator = '/res/generator.png'

CONSTANTS.element.subclasses = {}
CONSTANTS.element.subclasses.noSubclass = 'Element'
CONSTANTS.element.subclasses.root = 'RootElement'
CONSTANTS.element.subclasses.logic = 'LogicElement'
CONSTANTS.element.subclasses.action = 'ActionElement'

CONSTANTS.element.types = {}
CONSTANTS.element.types.noType = '-'
CONSTANTS.element.types.logicAnd = 'And'
CONSTANTS.element.types.logicOr = 'Or'
CONSTANTS.element.types.logicNot = 'Not'
CONSTANTS.element.types.generator = 'Generator'

-- Connector consts --
CONSTANTS.connector = {}
CONSTANTS.connector.size = 25

CONSTANTS.connector.paths = {}
CONSTANTS.connector.paths.input = '/res/input.png'
CONSTANTS.connector.paths.output = '/res/output.png'

CONSTANTS.connector.subclasses = {}
CONSTANTS.connector.subclasses.noSubclass = 'Connector'

CONSTANTS.connector.types = {}
CONSTANTS.connector.types.noType = '-'
CONSTANTS.connector.types.input = 'Input'
CONSTANTS.connector.types.output = 'Output'

return CONSTANTS