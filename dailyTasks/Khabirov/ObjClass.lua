local class = require 'lib/middleclass'
Obj = class('Obj');

function Obj:initialize(x, y, sprite, w, h, description)
	self.sprite=sprite;
	self.x=x;
	self.y=y;
	self.w=w or 32;
	self.h=h or 32;
	self.description=description or "None";
end

function Obj:draw(image)
love.graphics.draw(image, self.sprite, self.x, self.y);	
end

function Obj:update(dt)

end
return Obj;