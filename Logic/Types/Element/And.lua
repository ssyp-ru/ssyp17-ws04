And = class("And", Element)

function And:initialize(x, y)
	Element.initialize(self, x, y, 2, true)
end

function And:update()
	for i = 1, #self.inputs do
		if self.inputs[i].connection.parent.outputValue == 0 then
			self.outputValue = 0
			return
		end
	end
end

return And