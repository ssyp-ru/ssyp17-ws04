class = require("middleclass")
SoundManager = class('SoundManager')

function stopFor(index, element)
	element: stop()
end
function listFor(index, element)
	print(element)
end
function SoundManager:initialize()
	self.list = {}
end

function SoundManager:addSound(path, name)
	sound = love.audio.newSource(path)
	self.list[name] = sound
end

function SoundManager:removeSound(index)
	self.list[index] = nil
end
function SoundManager:showList()
	table.foreach(self.list, listFor)
end

function SoundManager:play(index, loop)
	print(index, self.list[index])
	
	if self.list[index] == nil then
		return
	else
		self.list[index]:play()
		self.list[index]:setLooping(loop)
	end
end

function SoundManager:stop(index)
	if self.list[index] == nil then
		return
	else
		self.list[index]:stop()
	end
end

function SoundManager:stopAll()
	table.foreach(self.list, stopFor)
end

function SoundManager:changeVolume(vol)
	love.audio.setVolume(vol)
end

return SoundManager