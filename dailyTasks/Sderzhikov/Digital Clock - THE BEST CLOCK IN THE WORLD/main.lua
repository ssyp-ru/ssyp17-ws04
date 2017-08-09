--[[
       Дароууу, это самые лучшие часы в мире. Делал часа 4, здесь нет ничего сложного.
       
       На клик переключает цвет циферок)
       Юзал Tween от kikito. Спасибо, крутая либа.
       Есть второй мейн, там цвет меняется каждый кадр
       
       Работает и под мобильным телефоном. Достаточно скопировать исходники в папку
       /storage/sdcard/lovegame/ 
       ИЛИ 
       /sdcard/lovegame/
       
       Пример:
       /sdcard/lovegame/main.lua
       
       Далее скачать приложение "Love for android"
       и запустить.
       
       
       Спасибо, Михаил Витальевич, за то, что обучили.
       
       Сейчас 18:47, 30.07.2K7
       Слушаю музон и пишу это.
       Машины еще не летают.
       
       
       
                                                              Made with Love,
                                                              Workshop №4, SSYP
                                                              'Summer School of Young Programmers'
                                                                Sderzhikov Egor,
                                                                        30.07.2K17
]]
require 'os'
tween = require "tween"

function love.load()

  clicks = 0

  love.window.setFullscreen(true) -- Fullscreen mode

  font = love.graphics.newFont('comic.ttf',70) -- comic sans ms font
  love.graphics.setFont(font)
  love.graphics.setColor(10,200,36)
  fps = 0
  speed = 3
  time = {}
  time.text = os.date("%X")
  time.x = 0
  time.y = 0
  timeTween = tween.new(speed,time,{y = love.graphics.getHeight() - 70},'inOutBack') -- First, none random tween
  date = {}
  date.text = os.date("%d.%m.2K%y")
  date.x = love.graphics.getWidth() - 370
  date.y = time.y + 50 
  dateTween = tween.new(speed,time,{y = time.y + 50},'inOutBack') -- First, none random tween
  math.randomseed(os.time())
end

function love.draw()
  if clicks < 100 then
    love.graphics.clear(0,0,0)
    love.graphics.print(time.text,time.x,time.y)
    love.graphics.print(date.text,date.x,date.y)
  else 
    font = love.graphics.newFont('comic.ttf',20) -- comic sans ms font
    r = love.math.random(50,255)
    g = love.math.random(50,255)
    b = love.math.random(50,255)
    love.graphics.setColor(r,g,b)
    love.graphics.setFont(font)
    love.graphics.print("Паздравляю, ты кликнул 100 раз и сломал всё. Ура!!!",love.graphics.getWidth()/2 - 200,love.graphics.getHeight()/2)
  end
end

function love.update(dt)
  if dt > 0.040 then return end
  fps = 1/dt
  time.text = os.date("%X")
  date.text = os.date("%d.%m.2K%y")
  if timeTween:update(dt) then

    timeTween = tween.new(speed,time,{y = love.math.random(0,love.graphics.getHeight() - 70)},'inOutBack')
    timeTween:update(dt)
  end
  if dateTween:update(dt) then
    dateTween = tween.new(speed,date,{y = love.math.random(0,love.graphics.getHeight() - 70)},'inOutBack')
    dateTween:update(dt)
  end
end

function love.mousepressed()
  clicks = clicks + 1
  r = love.math.random(50,255)
  g = love.math.random(50,255)
  b = love.math.random(50,255)
  love.graphics.setColor(r,g,b)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end
