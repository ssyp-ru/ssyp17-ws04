local class = require 'lib/middleclass'--Библиотека для симуляции класса, без этого это будет таблица с методами.
local Animal = class('Animal');

function Animal:initialize(name, hp, dmg)
	self.name = name
	self.hp = hp;
	self.dmg = dmg;
end

function Animal:info()
	print("Hi, my name: "..self.name);
	print("I'm have : "..self.hp.." HP".." and "..self.dmg.." damage.");
	print();
end

function Animal:attack(obj)
	obj.hp=obj.hp - self.dmg;
	self.hp=self.hp - obj.dmg/2;
	if(obj.hp>0) then
		print(self.name.." attack "..obj.name.." hit point "..self.dmg..", but take "..obj.dmg/2);
		print(self.name.." have "..self.hp..", "..obj.name.." have "..obj.hp);
		obj:attack(self);
	else
		if(obj==self) then
			print(self.name.." suicide");
		else
			print(self.name.." killed "..obj.name);
		end
	end
end

local dog = Animal:new("Dog",10,2);
--dog:info();
--dog:attack(dog);
return Animal;