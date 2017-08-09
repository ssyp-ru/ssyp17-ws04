local class = require 'lib/middleclass';
local Obj = require 'ObjClass';
CONSTANTS ={};
CONSTANTS.TEXTURE_SIZE=32;
Robot = class("Robot", Obj);

dir = {up = 1, right = 2, down = 3, left = 4};--Типа константа

function Robot:initialize(x, y, sprite, w, h, dir_, item)
	Obj.initialize(self, x, y, sprite, w, h, description);
	self.dir= dir_ or dir.up;
	self.item = item or nil;
end

function Robot:update(dt)

end

function Robot:move()
	if(self.dir == dir.left) then
		self.x = self.x - CONSTANTS.TEXTURE_SIZE;
	elseif(self.dir == dir.right)then
		self.x = self.x + CONSTANTS.TEXTURE_SIZE;
	elseif(self.dir == dir.up)   then
		self.y = self.y - CONSTANTS.TEXTURE_SIZE;
	elseif(self.dir == dir.down) then
		self.y = self.y + CONSTANTS.TEXTURE_SIZE;
	end
end

function Robot:turn(rot)
	if (rot == "left")then
		self.dir = self.dir - 1;
	else
		self.dir = self.dir + 1;
	end

	if (self.dir>4) then
		self.dir = 1
	elseif (self.dir<1) then
		self.dir = 4
	end
end
return Robot;