local class = require 'lib/middleclass';
local Obj = require 'ObjClass';
CONSTANTS ={};
CONSTANTS.TEXTURE_SIZE=32;
	
Robot = class("Robot", Obj);

function Robot:initialize(x, y, sprite, w, h, dir, item, obj)
	Obj.initialize(self, x, y, sprite, w, h, description);
	self.dir=dir or "up";
self.item = item or nil; 
end

function Robot:update(dt)

end

function Robot:move()
	if(self.dir == "left") then
		self.x = self.x - CONSTANTS.TEXTURE_SIZE;
	elseif(self.dir == "right")then
		self.x = self.x + CONSTANTS.TEXTURE_SIZE;
	elseif(self.dir == "up")   then
		self.y = self.y - CONSTANTS.TEXTURE_SIZE;
	elseif(self.dir == "down") then
		self.y = self.y + CONSTANTS.TEXTURE_SIZE;
	end
end

function Robot:turn(rot)
	if(self.dir == "left") then
		if(rot == "left") then
			self.dir = "down";
			return
		end
		if(rot == "right") then
			self.dir = "up";
			return
		end
	elseif(self.dir == "right") then
		if(rot == "left") then
			self.dir = "up";
			return
		end
		if(rot == "right") then
			self.dir = "down";
			return
		end
	elseif(self.dir == "up") then
		if(rot == "left") then
			self.dir = "left";
			return
		end
		if(rot == "right") then
			self.dir = "right";
			return
		end
	elseif(self.dir == "down") then
		if(rot == "left") then
			self.dir = "right";
			return
		end
		if(rot == "right") then
			self.dir = "left";
			return
		end
	end
end

return Robot;	