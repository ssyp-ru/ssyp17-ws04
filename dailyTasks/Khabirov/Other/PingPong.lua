local class = require 'lib/middleclass'
local Ball = class("Ball");

function Ball:initialize(r)
	self.r=r;
	self.x=love.math.random(self.r, love.graphics.getWidth()-self.r);
	self.y=love.math.random(self.r, love.graphics.getHeight()-self.r);
	self.speedx=200;
	self.speedy=200;
	self.color={love.math.random(0,255),
		love.math.random(0,255),
		love.math.random(0,255),
		255
	}
end

function Ball:screen(dt)
	local oldx,oldy=self.x, self.y;
	self.x=self.x+self.speedx*dt;
	self.y=self.y+self.speedy*dt;
	if self.x+self.r>love.graphics.getWidth() or self.x-self.r<0 then
		self.x=oldx;
		self.speedx=-(self.speedx)--+love.math.random(-100,100));
		self.color={love.math.random(0,255),
			love.math.random(0,255),
			love.math.random(0,255),
			255
		}
	end
	if self.y+self.r>love.graphics.getHeight() or self.y-self.r<0 then
		self.y=oldy;
		self.speedy=-(self.speedy)--+love.math.random(-100,100));
		self.color={love.math.random(0,255),
			love.math.random(0,255),
			love.math.random(0,255),
			255
		}
	end
end

function Ball:draw()
	love.graphics.setColor(unpack(self.color));
	love.graphics.circle("fill",self.x,self.y,self.r);
end

function Ball:update(dt)
	ball:screen(dt);
end

ball = Ball:new(10);

function love.load()
end

function love.draw()
	ball:draw();
end

function love.update(dt)
	ball:update(dt);
	if love.keyboard.isDown("escape") then
		love.event.quit();
	end
end