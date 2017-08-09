--Вопросы:
--Можно ли модифицирую метод оставить полностью предыдущий, но добавить новое.

local class = require 'lib/middleclass';--Подключение middleclass для реализации ООП на Lua
local inspect = require 'lib/inspect';
local Animal = require 'Animal'--Получение класса из файла Animal.lua 
Dog = class("Dog", Animal);--Создание нового класса Dog c унаследоваными методами от Animal
Cat = class("Cat", Animal);--Создание нового класса Cat c унаследоваными методами от Animal
Mouse = class("Mouse", Animal);--Создание нового класса Cat c унаследоваными методами от Animal
 

function Cat:initialize(name,hp,dmg,lazy_point)--Добавление нового поля lazy_point в класс
	Animal.initialize(self,name,hp,dmg);--Self указан для того чтобы предать Cat, а не Animal, как произошло бы если использовался Animal:initialize(name,hp,dmg);
	self.lazy_point=lazy_point;
end

function Mouse:initialize(name,hp,dmg,starve_point)
	Animal.initialize(self,name,hp,dmg);
	self.starve_point=starve_point or 10;
end
function Mouse:info()
	print("Hi, my name: "..self.name);
	print("I'm have : "..self.hp.." HP".." and "..self.dmg.." damage.");
	print("Starve: "..self.starve_point);
	print();
end

function Mouse:attack(obj)
	if(self.starve_point>0) then
		self.starve_point=self.starve_point-1;
		obj.hp=obj.hp - self.dmg-4;
	else
		obj.hp=obj.hp - self.dmg;
	end
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

homa=classHoma()
--print(inspect(cat));
local cat= Cat:new("Cat",50,9);--Создание объекта cat 
local dog= Dog:new("Dog",90,5);--Создание объекта dog 
local mouse= Mouse:new("Mouse",10,40);
cat:info();--Вызов метода info унаследованого от Animal;
dog:info();--Вызов метода info унаследованого от Animal;
mouse:info();
cat:attack(mouse);	
--dog:attack(cat);--Кто атакует, тот и выйгрывает.