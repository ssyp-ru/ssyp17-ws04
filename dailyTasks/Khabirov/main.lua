--Если нужно убрать ';', то нажмите ctrl+r в одну половину введите ';' и нажмите на кнопку заменить во всём тексте
local class         = require 'lib/middleclass';
local anim8         = require 'lib/anim8';
local tween         = require 'lib/tween';
local inspect       = require 'lib/inspect';
local setHeroColor  = require 'setHeroColor'--Функция для загрузки анимаций player.
local setModuleAnim = require 'setModuleAnim'--Функция для загрузки анимаций robot.
local Obj           = require 'ObjClass';
local Robot         = require 'RobotClass';
local Player        = require 'PlayerClass';
local Level         = require 'LevelClass';
local animationPlayer = {};--Для хранений анимаций робота
local animationRobot  = {};
--local canPlay      = true;--
local slide;--Переменая 
local playedAnim   = 'right' ;
local CONSTANTS         = {};
CONSTANTS.TEXTURE       = 32;
CONSTANTS.HERO_SPEED    = 0.8;
local decorations = {};
local buttonsPressed;--Нажатая кнопка


function love.keyreleased( key )
	buttonsPressed = nil;
end

function love.keypressed( key )
	buttonsPressed = key;
	print(buttonsPressed);
end


function Player:draw()--В зависимости от playedAnim проигрывает нужную анимацию
	love.graphics.rectangle('line',player.x, player.y, player.w, player.h);
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


function CheckCollision(player, decorations)--Проверка на коллизию
	for i=1, #decorations do --предыдущая версия на обрабатывала более 1 элемента
		if player.x < decorations[i].x+decorations[i].w and
		decorations[i].x < player.x+player.w		 and
		player.y < decorations[i].y+decorations[i].h and
		decorations[i].y < player.y+player.h then
			return true
		end
	end
end

function Player:update(dt)
	local oldx, oldy = self.x, self.y;
	if(self.canPlay) and self.alive then --Если сейчас игрок жив и может воиспроводить анимацию
		if buttonsPressed == 'd' then
			self.x = self.x + CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.x=oldx;
			else
				self.x=oldx;
--				print("You find PANDA!");
				animationPlayer.right:gotoFrame(1);
				animationPlayer.right:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x + CONSTANTS.TEXTURE} , 'linear');--Из-за специфики работы tween писать заменять 'x = self.x' на 'x = oldx' не рекомендуется
				playedAnim = 'right';
				self.canPlay = false;
			end
		elseif buttonsPressed == 'w' then
			self.y = self.y - CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.y = oldy;
			else
				self.y = oldy;
				animationPlayer.up:gotoFrame(1);
				animationPlayer.up:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y - CONSTANTS.TEXTURE} , 'linear');
				playedAnim = 'up';
				self.canPlay = false;
			end
		elseif buttonsPressed == 's' then
			self.y = self.y + CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.y = oldy;
			else
				self.y = oldy;
				animationPlayer.down:gotoFrame(1);
				animationPlayer.down:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {y = self.y + CONSTANTS.TEXTURE} , 'linear');
				playedAnim = 'down';
				self.canPlay = false;
			end
		elseif buttonsPressed == 'a' then
			self.x = self.x - CONSTANTS.TEXTURE;
			if CheckCollision(player, decorations) then
				self.x = oldx;
			else
				self.x = oldx;
				animationPlayer.left:gotoFrame(1);
				animationPlayer.left:resume();
				slide = tween.new(CONSTANTS.HERO_SPEED, self, {x = self.x - CONSTANTS.TEXTURE} , 'linear');
				playedAnim = 'left';
				self.canPlay = false;
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
	if (self.canPlay == false) and (self.x%(CONSTANTS.TEXTURE/2) == 0) and (self.y%(CONSTANTS.TEXTURE/2) == 0) then
		self.canPlay = true
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
	love.graphics.setColor(255,255,255);
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
	setHeroColor(animationPlayer,"blue");
	--
	decorations[2]= Obj:new(CONSTANTS.TEXTURE*3, CONSTANTS.TEXTURE*3, flower_white, 20, 22);
	decorations[1]= Obj:new(CONSTANTS.TEXTURE*5, CONSTANTS.TEXTURE*5, flower_white, 20, 22);
	decorations[3]= Obj:new(CONSTANTS.TEXTURE*2, CONSTANTS.TEXTURE*6, flower_white, 20, 22);
	setModuleAnim(animationRobot, 64, 64, 0.2, 7, 1);
	animationPlayer.right:gotoFrame(2); animationPlayer.right:pause();
	animationRobot.down  :gotoFrame(1); animationRobot.down  :pause();
--	level = Level:new('shema', lv101, grave_grass, player, robot, 'item');Как пример
	level = Level:new('shema', decorations, grave_grass, player, robot, 'item');

end

function love.draw()
--Робот отрисовывается под уровнем
	level:draw();
	love.graphics.rectangle('line',decorations[2].x, decorations[2].y, decorations[2].w, decorations[2].h);
	love.graphics.rectangle('line',decorations[1].x, decorations[1].y, decorations[1].w, decorations[1].h);
--	love.graphics.draw(imageNature, decorations[1].sprite, decorations[1].x, decorations[1].y);
--	love.graphics.draw(imageNature, decorations[2].sprite, decorations[2].x, decorations[2].y);
	love.graphics.rectangle('line',decorations[3].x, decorations[3].y, decorations[3].w, decorations[3].h);
--	decorations[3]:draw(imageNature);--(imageNature, decorations[3].sprite, decorations[3].x, decorations[3].y);

end

function love.update(dt)
	level:update(dt);
	animationRobot.down:update(dt);
	if love.keyboard.isDown("escape") then
		love.event.quit();
	end
end