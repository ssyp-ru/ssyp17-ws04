local class = require 'lib/middleclass'
local anim8 = require'lib/anim8';
local tween = require'lib/tween';
local inspect = require'lib/inspect';
local setHeroColor = require'setHeroColor'
local Texture=class('Texture');
local Hero=class('Hero');
local animation={}
local canPlay = true;
local CONSTANTS = {};
CONSTANTS.TEXTURE = 64;
CONSTANTS.HERO_SPEED=10;
CONSTANTS.ANIMATION_TIME=0.2;
local slide;
local image = love.graphics.newImage('res/chars.png');

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
	animation.Down:draw(image, self.x, self.y);
end
--CanPlay переменная для определения может ли проирываться анимация или нет
function Hero:update(dt)
function Hero:update(dt)
	print(self.x.."\t"..self.y.."\n");
	if(canPlay) then
		if love.keyboard.isDown("d") then
			print(inspect(player));
			slide = tween.new(CONSTANTS.ANIMATION_SPEED, self, {x = self.x + CONSTANTS.TEXTURE} , 'linear');
			CanPlay = false;
		end
	end
	animation.Down:update(dt);
	if(slide) then
		slide:update(dt);
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
	snow=Texture:new(grave_snow,10,10);
	setHeroColor(animation,"blue");
end

function love.draw()
	snow:all();
--	animation.Down:draw(image);
	player:draw();
end


function love.update(dt)
	player:update(dt);
	--	animation.Down:update(dt);
	if love.keyboard.isDown("escape") then
		love.event.quit();
	end
end

--[[
function love.keyreleased( key )
	if	key =='a' then
		button.state_a=true;
	else
		button.state_a=false;
	end
	if	key =='d' then
		button.state_d=true;
	else
		button.state_d=false;
	end
	if	key =='s' then
		button.state_s=true;
	else
		button.state_s=false;
	end
	if	key =='w' then
		button.state_w=true;
	else
		button.state_w=false;
	end
end

function love.keypressed( key )
	if	key =='a' then
		button.state.a=false;
	else
		button.state.a=true;
	end
	if	key =='w' then
		button.state.w=false;
	else
		button.state.w=true;
	end
	if	key == 'd' then
		button.state.d=false;
	else
		button.state.d=true;
	end
	if	key =='s' then
		button.state.s=false;
	else
		button.state.s=true;
	end
end
]]