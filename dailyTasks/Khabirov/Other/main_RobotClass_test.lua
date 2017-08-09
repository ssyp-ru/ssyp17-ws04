local class  = require 'lib/middleclass';
local Robot = require 'RobotClass';
local tiles1 = love.graphics.newImage("res/chars.png");
local CONSTANTS ={};
CONSTANTS.TEXTURE_SIZE=32;
local button={}
button.state_a = false;
button.state_d = false;
button.state_s = false;
button.state_w = false;

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
		button.state_a=false;
	else
		button.state_a=true;
	end
	if	key =='w' then
		button.state_w=false;
	else
		button.state_w=true;
	end
	if	key == 'd' then
		button.state_d=false;
	else
		button.state_d=true;
	end
	if	key =='s' then
		button.state_s=false;
	else
		button.state_s=true;
	end
end

function love:load()
	Quad =  love.graphics.newQuad(57, 3, 40, 45, tiles1:getWidth(), tiles1:getHeight());
	robot = Robot:new(CONSTANTS.TEXTURE_SIZE/2, CONSTANTS.TEXTURE_SIZE/2, Quad, _, _);
end

function love:draw()
	robot:draw(tiles1);
end


function love:update(dt)
	if love.keyboard.isDown("d") and (button.state_d == false) then
		love.keyreleased("d");
		robot:turn("right");
	end
	if love.keyboard.isDown("w") and (button.state_w == false) then
		love.keyreleased("w");
		robot:move();
	end
	robot:update();
end
