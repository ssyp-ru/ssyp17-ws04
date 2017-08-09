class = require "lib.middleclass"--Подключение библиотеки

Unit = class("Unit")--Создание класса Unitо

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)--Функция проверка на коллизию(соприкосновение)
	return x1 < x2+w2 and
	x2 < x1+w1 and
	y1 < y2+h2 and
	y2 < y1+h1
end

function Unit:initialize(name, x, y)--Создание класса
	self.name = name--Создание поля name и его инициализация
	self.x = x      --Создание поля x и его инициализация
	self.y = y      --Создание поля y и его инициализация
	self.r = love.math.random(2, 40)--Создание поля r и заполнение его случайным числом
	self.color = {love.math.random(1, 255),--Создание поля color и установка туда случайного цвета с прозрачностью (чем больше, тем меньше прозрачность).
		love.math.random(1, 255),
		love.math.random(1, 255), 250
	}
end

-- возвращ true если Unit на экране и не касается границ экрана
function Unit:isOnScreen()
	if self.x - self.r < 0
	or self.x + self.r > love.graphics.getWidth()
	or self.y - self.r < 0
	or self.y + self.r > love.graphics.getHeight()
	then
		return false
	else
		return true
	end
end
-- ИИ
function Unit:update(dt)--Создание метода для юнит 
	self.x = self.x + love.math.random(-100, 100) * dt
	self.y = self.y + love.math.random(-100, 100) * dt
end

function Unit:draw()--Добавление метода draw классу unit
	love.graphics.setColor(unpack(self.color))--Распаковка таблицы self.color и установка цвета
	love.graphics.circle("fill", self.x, self.y, self.r)--Отрисовка круга
	love.graphics.setColor(255,255,255);--Установка белого цвета
	love.graphics.print(self.name, self.x-self.r, self.y)--Вывод имени на окружности
	love.graphics.print("x:"..math.floor(self.x)..",y:"..math.floor(self.y),--Вывод координат
		self.x - self.r, self.y + 10)
end

UnitDrop = class("UnitDrop", Unit)--Создание нового класса UnitDrop, наследующего методы от  Unit
function UnitDrop:initialize(name, x, y)--Модификация класса UnitDrop(теперь они имеют красный отенок) 
	Unit.initialize(self, name, x, y)
	self.color = {love.math.random(155, 255),
		0,
		0,
		255
	}	
end
-- ИИ
function UnitDrop:update(dt)--Модификация метода для UnitDrop
	if self.y < love.graphics.getHeight() - self.r * 2 then--Если объект не упал уменьшать координаты
		self.y = self.y + 100 * dt
	end
end

UnitPong = class("UnitPong", Unit);--Создание класса наследующиий от Unit
function UnitPong:initialize(name, x, y)--Модификация класса чтоб они были только синего цвета
	Unit.initialize(self, name, x, y)
	self.color = {0,
		0,
		love.math.random(155, 255),
		255
	}--Генерация поведения
	if love.math.random() < 0.5 then
		self.speedx = 0
		self.speedy = 80
	else
		self.speedx = 80
		if love.math.random() < 0.5 then
			self.speedy = 0
		else
			self.speedy = 80
		end
	end
	self.speedx=200;
	self.speedy=200;
end
-- ИИ
function UnitPong:update(dt)--Модификация метода update для UnitPong
	local oldx, oldy = self.x, self.y
	self.x = self.x + self.speedx * dt
	if not self:isOnScreen() then
		self.x = oldx
		self.speedx = -self.speedx
	end
	self.y = self.y + self.speedy * dt
	if not self:isOnScreen() then
		self.y = oldy
		self.speedy = -self.speedy
	end
end

Player = class("Player", Unit)--Создание класса Player
function Player:initialize(name, x, y, keys)--Модификация класса Player
	Unit.initialize(self, name, x, y)--Модификация класса чтоб объекты были только зелёного цвета
	self.color = {0,
		love.math.random(150, 250),
		0,
		255
	}	
	self.speed = 100
	self.keys = keys or {left = "a", right = "d", up = "w", down = "s"}--
end

function Player:control(dt)--Создание метода control для Player
	local oldx, oldy = self.x, self.y
	local sx, sy = 0, 0
	--Условие при нажатии клавиши чтоб не выходил за поле(точнее в таком случае их просто возвращать обратно), с остальными то же самое
	if love.keyboard.isDown(self.keys.left) and
	self.x > 0 + self.r then--Зачем прибавлять 0?
		sx = -self.speed * dt
	elseif love.keyboard.isDown(self.keys.right) and
	self.x < love.graphics.getWidth() - self.r then
		sx = self.speed * dt
	end
	if love.keyboard.isDown(self.keys.up) and
	self.y > 0 + self.r then
		sy = -self.speed * dt
	elseif love.keyboard.isDown(self.keys.down) and
	self.y < love.graphics.getHeight() - self.r then
		sy = self.speed * dt
	end
	self.x = self.x + sx
	self.y = self.y + sy
	if self:collideWithAny() then
		self.x = oldx
		self.y = oldy
	end
end

--проверка столкновения текущего объекта с другим other
function Player:collideWith(other) 
	if self == other then
		return false
	end
	if math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2)
	< self.r + other.r
	then
		return true
	else
		return false
	end
end

function Player:collideWithAny() 
	for i = 1, #units do
		if self:collideWith(units[i]) then
			return true
		end
	end
	return false
end

function Player:update(dt) 
	self:control(dt) 
end
--table библиотека для работы с таблицами
function love.load()
	units = {}--Создание списка units
	for i = 1, 5 do--Создание объектов Unit 
		units[#units + 1] = Unit:new("ball"..i, 
			love.math.random(1,love.graphics.getWidth()), --Установка случайных начальных координат
			love.math.random(1,love.graphics.getHeight()))
	end
	for i = 1, 10 do--Создание объектов UnitDrop
		units[#units + 1] = UnitDrop:new("Drop"..i, 
			love.math.random(1,love.graphics.getWidth()),--Установка случайных начальных координат
			love.math.random(1,love.graphics.getHeight()))
	end
	units[#units + 1] = Player:new("IGROK", --Создание объекта класса Player
		love.graphics.getWidth() / 2,--Начальные координаты в середине экрана
		love.graphics.getHeight() / 2)
	units[#units + 1] = Player:new("IGROK2", 
		love.graphics.getWidth() / 2 + 100,
		love.graphics.getHeight() / 2,
		{left = "left", right = "right", up = "up", down = "down"})
	for i = 1, 10 do --Создание объекта класса UnitPong
		units[#units + 1] = UnitPong:new("Pong"..i, 
			love.math.random(1,love.graphics.getWidth()),
			love.math.random(1,love.graphics.getHeight()))
	end	
	love.graphics.setBackgroundColor(2,4,77);
end

function love.draw()--Отрисовка всех Unitов их методами
	for i = 1, #units do
		units[i]:draw()
	end
end

function love.update(dt)
	for i = 1, #units do--Update всех Unitов
		units[i]:update(dt)
	end
	if love.keyboard.isDown("escape") then--При нажатии на esc выход
		love.event.quit()
	end
end
