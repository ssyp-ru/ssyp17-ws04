anim8 = require 'libs/anim8'

love.window.setFullscreen(true)

player = {}
need = 1

function player.load()
  last = 1
  time = 0.15 * need
  player.image = love.graphics.newImage('img/player.png')
  player.g = anim8.newGrid(32, 32, player.image:getWidth(), player.image:getHeight())
  player.animation_right = anim8.newAnimation(player.g('1-3',3), time)
  player.animation_left = anim8.newAnimation(player.g('1-3',2), time)
  player.animation_front = anim8.newAnimation(player.g('1-3',1),time)
  player.animation_back = anim8.newAnimation(player.g('1-3',4), time)
  player.stayf = anim8.newAnimation(player.g('2-2',1),time)
  player.stayl = anim8.newAnimation(player.g('2-2',2),time)
  player.stayr = anim8.newAnimation(player.g('2-2',3),time)
  player.stayb = anim8.newAnimation(player.g('2-2',4),time)
  player.tec = player.animation_front
end

function player.draw()
  player.tec:draw(player.image,love.graphics.getWidth() /2 + 100,love.graphics.getHeight() /2 + 100,0,1,1,player.image:getWidth(),player.image:getHeight())
end


