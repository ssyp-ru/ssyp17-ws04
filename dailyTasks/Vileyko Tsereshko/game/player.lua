Player = require('middleclass')('Player')

function Player:initialize(x, y, r, v, hp, dmg) 
	self.x = x
	self.y = y
	self.r = r
	--..
end

function Player:moveup() 
	self.y = self.y - self.v
end

