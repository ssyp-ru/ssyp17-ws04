local class         = require 'lib/middleclass';
local anim8         = require  'lib/anim8';
local tween         = require 'lib/tween';
local inspect       = require 'lib/inspect';
local setHeroColor  = require 'setHeroColor'
local setModuleAnim = require 'setModuleAnim'
local Obj           = require 'ObjClass';
local Robot         = require 'RobotClass';
local Player        = require 'Old_PlayerClass';
local Level         = require 'Level';

local animationPlayer = {};
local animationRobot  = {};
local canPlay      = true;
local slide;
local playedAnim   = 'right' ;
local CONSTANTS         = {};
CONSTANTS.TEXTURE       = 32;
CONSTANTS.HERO_SPEED    = 0.8;
local case = {} ;
local decorations = {};
--Рисовка игрока в зависимости от значения в переменной playedAnim
function Player:draw()
	love.graphics.rectangle('line', self.x, self.y, self.w, self.h);
	if     (playedAnim == 'right') then
		animationPlayer.right:draw(imagePlayer, self.x, self.y);
	elseif (playedAnim == 'left' ) then
		animationPlayer.left:draw (imagePlayer, self.x, self.y);
	elseif (playedAnim == 'down' ) then
		animationPlayer.down:draw (imagePlayer, self.x, self.y);
	elseif (playedAnim == 'up'   ) then
		animationPlayer.up:draw   (imagePlayer, self.x, self.y);
	end
end

function CheckCollision(player, decorations)
--	print(decorations[1].w..'-'..decorations[1].h, '\n');

	for i=1, #decorations do
		print('Player\t\t'..'decorations'..'\n'..'x: '..(player.x/32)..' y: '..(player.y/32)..'\t'..'x: '..(decorations[i].x/32)..' y: '..(decorations[i].y/32)..'\nw: '..(player.w/32)..' h: '..
			(player.h/32)..'\t'..'w: '..(decorations[i].w/32)..' h: '..(decorations[i].h/32));
		return player.x < decorations[i].x+decorations[i].w and
		decorations[i].x < player.x+player.w and
		player.y < decorations[i].y+decorations[i].h and
		decorations[i].y < player.y+player.h
	end
end

function Player:update(dt)
	local oldx, oldy = self.x, self.y;
	if(canPlay) and player.alive then --Если сейчас игрок жив и может воиспроводить анимацию
		if love.keyboard.isDown("d") then
			self.x = self.x + CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.x=oldx;
			else
				self.x=oldx;
				print("You find PANDA!");
				animationPlayer.right:gotoFrame(1);
				animationPlayer.right:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x + CONSTANTS.TEXTURE} , 'linear');
				playedAnim = 'right';
				canPlay = false;
			end
		elseif love.keyboard.isDown("w") then
			self.y = self.y - CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.y = oldy;
			else
				self.y = oldy;
				animationPlayer.up:gotoFrame(1);
				animationPlayer.up:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y - CONSTANTS.TEXTURE} , 'linear');
				playedAnim = 'up';
				canPlay = false;
			end
		elseif love.keyboard.isDown("s") then
			self.y = self.y + CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.y = oldy;
			else
				self.y = oldy;
				animationPlayer.down:gotoFrame(1);
				animationPlayer.down:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y + CONSTANTS.TEXTURE} , 'linear');
				playedAnim = 'down';
				canPlay = false;
			end
		elseif love.keyboard.isDown("a") then
			self.x = self.x - CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.x = oldx;
			else
				self.x = oldx;
				animationPlayer.left:gotoFrame(1);
				animationPlayer.left:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x - CONSTANTS.TEXTURE} , 'linear');
				playedAnim = 'left';
				canPlay = false;
			end
		end
	end

	if(playedAnim == 'right') then
		animationPlayer.right:update(dt);
	elseif(playedAnim == 'down') then
		animationPlayer.down:update (dt); 
	elseif(playedAnim == 'left') then
		animationPlayer.left:update (dt);
	elseif(playedAnim == 'up') then
		animationPlayer.up:update   (dt);
	end

	if(slide) then
		slide:update(dt);
	end
	if (canPlay == false) and (self.x%(CONSTANTS.TEXTURE/2) == 0) and (self.y%(CONSTANTS.TEXTURE/2) == 0) then
		canPlay = true
		if (playedAnim == 'right' ) then 
			animationPlayer.right:gotoFrame(4);
			animationPlayer.right:pause();
		elseif (playedAnim == 'down' ) then
			animationPlayer.down:gotoFrame(4);
			animationPlayer.down:pause();
		elseif (playedAnim == 'left' ) then
			animationPlayer.left:gotoFrame(4);
			animationPlayer.left:pause();
		elseif (playedAnim == 'up' ) then
			animationPlayer.up:gotoFrame(4);
			animationPlayer.up:pause();
		end
	end
end

--Робот 64 на 64
function love.load()
	robot  = Robot :new(love.graphics.getWidth, love.graphics.getHeight, animationRobot, 64, 64); 
	player = Player:new(CONSTANTS.TEXTURE, CONSTANTS.TEXTURE, animationPlayer, 32, 48, false);
	imagePlayer  = love.graphics.newImage("res/chars.png");
	imageRobot   = love.graphics.newImage("res/mecha26.png");
	imageFloor   = love.graphics.newImage("res/tiles1.png");
	imageNature  = love.graphics.newImage("res/tiles2.png");
	local grave_grass = love.graphics.newQuad(0,  0, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, imageFloor:getWidth(), imageFloor:getHeight());
	local grave_sand  = love.graphics.newQuad(0,100, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, imageFloor:getWidth(), imageFloor:getHeight());
	local grave_grave = love.graphics.newQuad(0,200, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, imageFloor:getWidth(), imageFloor:getHeight());
	local grave_snow  = love.graphics.newQuad(0,300, CONSTANTS.TEXTURE,CONSTANTS.TEXTURE, imageFloor:getWidth(), imageFloor:getHeight());
	local flower_white = love.graphics.newQuad(356 ,5 ,22 ,20 , imageNature:getWidth(), imageNature:getHeight());
	love.graphics.setBackgroundColor(210,210,210);
	floor = grave_grass;
	setHeroColor(animationPlayer,"yellow");
	--
	decorations[1]= Obj:new(CONSTANTS.TEXTURE*3, CONSTANTS.TEXTURE*3, flower_white, 20, 22);
	setModuleAnim(animationRobot, 64, 64, 0.2, 7, 1);
	animationPlayer.right:gotoFrame(2);
	animationPlayer.right:pause();
	animationRobot.down:gotoFrame(1);
	animationRobot.down:pause();
	print(decorations[1].w..'-'..decorations[1].h, '\n');
--
end

function love.draw()
--		for i=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
--			for j=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
--				love.graphics.draw(imageFloor, floor.sprite, i, j);
--			end
--		end
	for i=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
		for j=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
			love.graphics.draw(imageFloor, floor, i, j);
		end
	end

	love.graphics.draw(imageNature, decorations[1].sprite, decorations[1].x, decorations[1].y);
	love.graphics.rectangle('line',decorations[1].x, decorations[1].y, decorations[1].w, decorations[1].h);
	animationRobot.down:draw(imageRobot, 0, 0, 0 ,1.1, 1.1);
	player:draw();
end

function love.update(dt)
	player:update(dt);
	animationRobot.down:update(dt);
	if love.keyboard.isDown("escape") then
		love.event.quit();
	end

end