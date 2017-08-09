require('Libs.accessory')
class = require('Libs.middleclass')
CONSTANTS = require("constants")

Description = require("Types.Description")
Sprite = require("Types.Sprite")

Connector = require("Types.Connector.Connector")
Input = require("Types.Connector.Input")
Output = require("Types.Connector.Output")

Element = require("Types.Element.Element")
And = require("Types.Element.And")
Test = require("Types.Element.Test")

function love.load()
	if arg[#arg] == '-debug' then require("mobdebug").start() end
	
	logicAnd = And:new(10, 10)
	test = Test:new(0, 0)

	print('')
	
	Element.connect(logicAnd.inputs[1], test.output)
	Element.connect(logicAnd.inputs[2], test.output)
	
	print('')
	
	test:update()
	logicAnd:update()
	
	print('')
end

function love.update()
	
end

function love.draw()
	
end