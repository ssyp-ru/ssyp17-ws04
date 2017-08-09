require('logic.logic')

local class  = require('lib/middleclass')
local Robot = require 'RobotClass';
local tiles1 = love.graphics.newImage("res/chars.png");

function love.load() 
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
  cooldown = 0
  
  Quad = love.graphics.newQuad(57, 3, 40, 45, tiles1:getWidth(), tiles1:getHeight())
	robot = Robot:new(CONSTANTS.TEXTURE_SIZE/2, CONSTANTS.TEXTURE_SIZE/2, Quad)
  robot.dir = 'right'

  generator = Generator:new(0, 0, true)
  action = Action:new(500, 500, true)
  
  editor = Editor:new()
  editor.scheme:addElement(generator)
  editor.scheme:addElement(action)
  editor.scheme:addConnection(generator.output, action.inputs[1])
end

function love.keyreleased(key)
end

function love.keypressed(key)
end

function love:update(dt)
  if cooldown == 0 then
    cooldown = 20
    
    editor.scheme:update()
    actions = editor.scheme:getActions()
    
    if actions[1] == 'Action' then
      robot:move()
    end
  else 
    cooldown = cooldown - 1
  end
end

function love:draw()
	robot:draw(tiles1)
end