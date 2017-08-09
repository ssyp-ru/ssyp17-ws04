local class = require 'lib/middleclass';
local Obj = require 'ObjClass';
--
local CONSTANTS ={};
CONSTANTS.TEXTURE_SIZE=32;
Player = class("Player", Obj);
local imagePlayer  = love.graphics.newImage("res/chars.png");
--
function Player:initialize(x, y, sprite, w, h, mount, canPlay, tweenPlayer, playedAnim)
	Obj.initialize(self, x, y, sprite, w, h, description);
	self.mount = mount or false;--true если в роботе
	self.alive = true;
	self.canPlay = true;
	self.playedAnim = playedAnim;
end

function Player:move(dir)
	if self.alive == true then
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

function Player:draw(animationPlayer)
	if(self.playedAnim == 'right') then
		animationPlayer.right:draw(imagePlayer, self.x, self.y);
	elseif (self.playedAnim == 'left') then
		animationPlayer.left:draw(imagePlayer, self.x, self.y);
	elseif (self.playedAnim == 'down') then
		animationPlayer.down:draw(imagePlayer, self.x, self.y);
	elseif (self.playedAnim == 'up') then
		animationPlayer.up:draw(imagePlayer, self.x, self.y);
	end
end

function Player:update(dt, vect, animationPlayer)
	if(canPlay) and self.alive then
		if love.keyboard.isDown(vect) then
			animationPlayer.right:gotoFrame(1);
			animationPlayer.right:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x + CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'right';
			canPlay = false;
		end if love.keyboard.isDown(vect) then
			animationPlayer.up:gotoFrame(1);
			animationPlayer.up:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y - CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'up';
			canPlay = false;
		end	if love.keyboard.isDown(vect) then
			animationPlayer.down:gotoFrame(1);
			animationPlayer.down:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y + CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'down';
			canPlay = false;
		end	if love.keyboard.isDown(vect) then
			animationPlayer.left:gotoFrame(1);
			animationPlayer.left:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x - CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'left';
			canPlay = false;
		end
	end
	if(playedAnim == 'right') then
		animationPlayer.right:update(dt);
	elseif(playedAnim == 'down') then
		animationPlayer.down:update(dt); 
	elseif(playedAnim == 'left') then
		animationPlayer.left:update(dt);
	elseif(playedAnim == 'up') then
		animationPlayer.up:update(dt);
	end

	if(slide) then
		slide:update(dt);
	end

	if (canPlay == false) and (self.x%(CONSTANTS.TEXTURE/2) == 0) and (self.y%(CONSTANTS.TEXTURE/2) == 0) then
		canPlay = true
		if (playedAnim == 'right' ) then 
			animationPlayer.right:gotoFrame(2);
			animationPlayer.right:pause(2);
		elseif (playedAnim == 'down' ) then
			animationPlayer.down:gotoFrame(2);
			animationPlayer.down:pause(2);
		elseif (playedAnim == 'left' ) then
			animationPlayer.left:gotoFrame(2);
			animationPlayer.left:pause(2);
		elseif (playedAnim == 'up' ) then
			animationPlayer.up:gotoFrame(2);
			animationPlayer.up:pause(2);
		end
	end

end

return Player;