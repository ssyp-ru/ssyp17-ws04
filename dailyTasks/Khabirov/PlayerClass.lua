local class = require 'lib/middleclass';
local Obj = require 'ObjClass';
--
local CONSTANTS ={};
CONSTANTS.TEXTURE_SIZE=32;
Player = class("Player", Obj);
--
function Player:initialize(x, y, sprite, w, h, mount, canPlay)
	Obj.initialize(self, x, y, sprite, w, h, description);
	self.mount = mount or false;--true если в роботе
	self.alive = true;
	self.canPlay = true;
end

function Player:move(dir)
	if alive == true then
		if(dir == "left") then
			self.x = self.x - CONSTANTS.TEXTURE_SIZE;
		elseif(dir == "right") then
			self.x = self.x + CONSTANTS.TEXTURE_SIZE;
		elseif(dir == "up") then
			self.y = self.y - CONSTANTS.TEXTURE_SIZE;
		elseif(dir == "down") then
			self.y = self.y + CONSTANTS.TEXTURE_SIZE;
		end
	end
end
return Player