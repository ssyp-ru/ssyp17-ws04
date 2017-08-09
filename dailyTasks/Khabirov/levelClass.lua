lvl01 = require ("level 1/01")
local class         = require 'lib/middleclass';
local CONSTANTS         = {};
CONSTANTS.TEXTURE       = 32;
CONSTANTS.HERO_SPEED    = 0.8;
imageRobot   = love.graphics.newImage("res/mecha26.png");
imageNature  = love.graphics.newImage("res/tiles2.png");
imageFloor   = love.graphics.newImage("res/tiles1.png");
--Я не справляюсь
Level = class('Level');

function Level:initialize(shema, decorations, texture, player, robot, item)
	self.shema = shema;        
	self.decorations = decorations;
	self.texture = texture;
	self.player = player; --^
	self.robot = robot;	 --/|\
	self.item = item;  	--/ | \
--						    |
end	--                      |
--  						|
--Функция загрузки -- Оно же произойдёт в инициализации?

function Level:draw()
--Функция отрисовки (уровня)
	for i=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
		for j=0,love.graphics.getWidth(),CONSTANTS.TEXTURE do
			love.graphics.draw(imageFloor, self.texture, i, j);
		end
	end
	player:draw();
	for i= 1, #self.decorations do
		self.decorations[i]:draw(imageNature);
	end
end

function Level:update(dt)
	player:update(dt);
end
return Level
--Нажатые клавиши и пересчит позиции робота 
--схема