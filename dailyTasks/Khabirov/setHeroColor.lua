local anim8 = require'lib/anim8';
local image =love.graphics.newImage('res/chars.png')

function setHeroColor(anim, color)
	local i,j=0,0;
	if    (color == "orange")then
		i=0;
	elseif(color == "black" )then
		i=3;
	elseif(color == "grey"  )then
		i=6;
	elseif(color == "blue"  )then
		i=9;
	elseif(color == "yellow")then
		i,j=0,4;
	elseif(color == "brown" )then
		i,j=3,4;
	elseif(color == "green" )then
		i,j=6,4;
	elseif(color == "red"   )then
		i,j=9,4;
	end
	local g = anim8.newGrid(48, 48, image:getWidth(), image:getHeight(), 48*i+6, 48*j+3);
	anim.down    = anim8.newAnimation(g('1-3',1, 2, 1), 0.2);
	anim.left    = anim8.newAnimation(g('1-3',2, 2, 2), 0.2);
	anim.right   = anim8.newAnimation(g('1-3',3, 2, 3), 0.2);
	anim.up      = anim8.newAnimation(g('1-3',4, 2, 4), 0.2);
end
return setHeroColor;