--Рекомендую переписать. Добавить разбиение строки на символы, и добавить функцю(метод) для заполнения таблицы.
local tween = require 'lib/tween'
local CONSTANTS={};
CONSTANTS.FONT=30;
CONSTANTS.time_play_tween = 5;--Можно ли это оптимизовать?(Не конкретно эту строку, а весь код?)
CONSTANTS.letter_Width    =  (8/12.5)*CONSTANTS.FONT ;--Есть ли смысл измень для того чтобы компилятор не работал с дробными числами 
CONSTANTS.letter_Height   =  (11/12.5)*CONSTANTS.FONT ;
CONSTANTS.space   = CONSTANTS.letter_Width ;--На случай если понадобится изменить размер межд символами. Если изменить будет происходить не то что хочется тк размеры букв разные, и размеры символов не учитываются.
--Размер буквы: 8, 11;--При 12.5
math.randomseed(os.time());

function love.load()
	label={};
	label.g = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "G"}
	label.a = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "a"}
	label.m = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "m"}
	label.e = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "e"}

	label.o = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "O"}
	label.v = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "v"}
	label.е = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "e"}
	label.r = { x=math.random(CONSTANTS.letter_Width, love.graphics.getWidth()), y=math.random(CONSTANTS.letter_Height, love.graphics.getHeight()), text = "r"}

	g = tween.new(CONSTANTS.time_play_tween, label.g, {x = (love.graphics.getWidth()/2)-(4*CONSTANTS.letter_Width + 4*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'inElastic'   );--linear
	a = tween.new(CONSTANTS.time_play_tween, label.a, {x = (love.graphics.getWidth()/2)-(3*CONSTANTS.letter_Width + 3*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'outElastic'  );--inOutBounce
	m = tween.new(CONSTANTS.time_play_tween, label.m, {x = (love.graphics.getWidth()/2)-(2*CONSTANTS.letter_Width + 2*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'inOutElastic');
	e = tween.new(CONSTANTS.time_play_tween, label.e, {x = (love.graphics.getWidth()/2)-(1*CONSTANTS.letter_Width + 1*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'outInElastic');
--Будет ли он умножать на 1?
	o = tween.new(CONSTANTS.time_play_tween, label.o, {x = (love.graphics.getWidth()/2)+(1*CONSTANTS.letter_Width + 1*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'outElastic'  );
	v = tween.new(CONSTANTS.time_play_tween, label.v, {x = (love.graphics.getWidth()/2)+(2*CONSTANTS.letter_Width + 2*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'inOutElastic');
	е = tween.new(CONSTANTS.time_play_tween, label.е, {x = (love.graphics.getWidth()/2)+(3*CONSTANTS.letter_Width + 3*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'inElastic'   );--Внимание! Используется русская буква.
	r = tween.new(CONSTANTS.time_play_tween, label.r, {x = (love.graphics.getWidth()/2)+(4*CONSTANTS.letter_Width + 4*CONSTANTS.space), y = love.graphics.getHeight()/2-CONSTANTS.letter_Height}, 'outInElastic');
	font=love.graphics.newFont(CONSTANTS.FONT);
	love.graphics.setFont(font)
end

function love.update(dt)
	g:update(dt);
	a:update(dt);
	m:update(dt);
	e:update(dt);
	o:update(dt);
	v:update(dt);
	е:update(dt);
	r:update(dt);
end

function love.draw()
	love.graphics.print(label.g.text, label.g.x, label.g.y);
	love.graphics.print(label.a.text, label.a.x, label.a.y);
	love.graphics.print(label.m.text, label.m.x, label.m.y);
	love.graphics.print(label.e.text, label.e.x, label.e.y);
	love.graphics.print(label.o.text, label.o.x, label.o.y);
	love.graphics.print(label.v.text, label.v.x, label.v.y);
	love.graphics.print(label.е.text, label.е.x, label.е.y);
	love.graphics.print(label.r.text, label.r.x, label.r.y);
end
