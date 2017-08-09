local anim8 = require 'lib/anim8';
local image = love.graphics.newImage('res/mecha26.png')

function setModuleAnim(anim, w, h, tm, w1, h1, obr)--w1 h1 'помехи'
	local g = anim8.newGrid(w, h, image:getWidth(), image:getHeight(), w1, h1);
	--Переменная для           'кадры', их строка, какой кадр какая строка
	anim.down  = anim8.newAnimation(g('1-4',1), tm);
	anim.left  = anim8.newAnimation(g('1-4',2), tm);
	anim.right = anim8.newAnimation(g('1-4',3), tm);
	anim.up    = anim8.newAnimation(g('1-4',4), tm);
end
return setModuleAnim;