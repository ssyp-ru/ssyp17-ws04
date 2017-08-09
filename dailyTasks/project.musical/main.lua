Class = require('Class')
SoundManager = require("SoundManager")

obj = SoundManager:new()

obj:addSound("musik/The Boy Who Shattered Time (MitiS Remix).mp3", "lol")
obj:addSound("musik/Hard+Bass+-+Раз+Раз+Раз+Это+Хард+Басс+D.mp3", "kek")
obj:addSound("musik/Fleslit_-_Locked_Up.mp3", "cheburek")
obj:showList()

function love.load()
	p = 1
end

function love.update(dt)
	--obj:play("lol", false)
	--obj:stopAll()
	check()
end

function love.draw()

end

function check ()

	if love.keyboard.isDown('space') and p == 1 then
		p = p + 1
		obj:stopAll()
		obj:play(1, true)
	end

	if love.keyboard.isDown('space') and p == 2 then
		p = p + 1
		obj:stopAll()
		obj:play(2, true)
	end

	if love.keyboard.isDown('space') and p == 3 then
		p = p + 1
		obj:stopAll()
		obj:play(3, true)
	end
end