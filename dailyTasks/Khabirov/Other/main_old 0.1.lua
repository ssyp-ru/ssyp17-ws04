local class   = require 'lib/middleclass'
local anim8   = require'lib/anim8';
local tween   = require'lib/tween';
local inspect = require'lib/inspect';
local setHeroColor = require'setHeroColor'
local Texture   = class('Texture');
local Hero      = class('Hero');
local animation = {}
local canPlay   = true;
local CONSTANTS = {};
CONSTANTS.TEXTURE = 32;--32
CONSTANTS.HERO_SPEED=1;--1
local slide;
local image = love.graphics.newImage('res/chars.png');
local playedAnim = 'right' ;

function Texture:initialize(quad, x, y)
	self.quad=quad;
	self.x=x;
	self.y=y;
end

function Texture:all()
	for i=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
		for j=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
			love.graphics.draw(tiles1,self.quad,i,j);
		end
	end
end

function Hero:initialize(x, y, canMove)
	self.x = x or CONSTANTS.TEXTURE/2;
	self.y = y or CONSTANTS.TEXTURE/2;
	self.canMove= canMove or true; 
end

function Hero:draw()
	if(playedAnim == 'right') then
		animation.right:draw(image, self.x, self.y);
	elseif (playedAnim == 'left') then
		animation.left:draw(image, self.x, self.y);
	elseif (playedAnim == 'down') then
		animation.down:draw(image, self.x, self.y);
	elseif (playedAnim == 'up') then
		animation.up:draw(image, self.x, self.y);
	end
end

function Hero:update(dt)
	if(canPlay) then
		if love.keyboard.isDown("d") then
			animation.right:gotoFrame(1);
			animation.right:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x + CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'right';
			canPlay = false;
		end if love.keyboard.isDown("w") then
			animation.up:gotoFrame(1);
			animation.up:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y - CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'up';
			canPlay = false;
		end	if love.keyboard.isDown("s") then
			animation.down:gotoFrame(1);
			animation.down:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y + CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'down';
			canPlay = false;
		end	if love.keyboard.isDown("a") then
			animation.left:gotoFrame(1);
			animation.left:resume();
			slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x - CONSTANTS.TEXTURE} , 'linear');
			playedAnim = 'left';
			canPlay = false;
		end
	end
	if(playedAnim == 'right') then
		animation.right:update(dt);
	elseif(playedAnim == 'down') then
		animation.down:update(dt);
	elseif(playedAnim == 'left') then
		animation.left:update(dt);
	elseif(playedAnim == 'up') then
		animation.up:update(dt);
	end

	if(slide) then
		slide:update(dt);
	end

	if (canPlay == false) and (self.x%(CONSTANTS.TEXTURE/2) == 0) and (self.y%(CONSTANTS.TEXTURE/2) == 0) then
		canPlay = true
		if (playedAnim == 'right' ) then 
			animation.right:gotoFrame(2);
			animation.right:pause(2);
		elseif (playedAnim == 'down' ) then
			animation.down:gotoFrame(2);
			animation.down:pause(2);
		elseif (playedAnim == 'left' ) then
			animation.left:gotoFrame(2);
			animation.left:pause(2);
		elseif (playedAnim == 'up' ) then
			animation.up:gotoFrame(2);
			animation.up:pause(2);
		end
	end
end

function love.load()
	player = Hero:new();
	tiles1 = love.graphics.newImage("res/tiles1.png");
	local grave_grass = love.graphics.newQuad(0,  0, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, tiles1:getWidth(), tiles1:getHeight());
	local grave_sand  = love.graphics.newQuad(0,100, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, tiles1:getWidth(), tiles1:getHeight());
	local grave_grave = love.graphics.newQuad(0,200, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, tiles1:getWidth(), tiles1:getHeight());
	local grave_snow  = love.graphics.newQuad(0,300, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, tiles1:getWidth(), tiles1:getHeight());
	love.graphics.setBackgroundColor(210,210,210);
	snow=Texture:new(grave_grass,10,10);
	setHeroColor(animation,"green");
	animation.right:gotoFrame(2);
	animation.right:pause(2);
end

function love.draw()
	snow:all();
	player:draw();
end


function love.update(dt)
	player:update(dt);
	if love.keyboard.isDown("escape") then
		love.event.quit();
	end
end