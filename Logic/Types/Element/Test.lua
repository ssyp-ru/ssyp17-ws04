Test = class('Test', Element)

function Test:initialize(x, y)
	Element.initialize(self, x, y, 0, false)
end

function Test:update()
	self.outputValue = 1
end

return Test