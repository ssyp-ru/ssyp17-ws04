local sti = require "sti"

function love.load()
	-- Print STI Version
	print(sti._VERSION)

	-- Set Physics Meter
	love.physics.setMeter(32)

	-- Load map
	map = sti.new("assets/ortho.lua", { "box2d" })
	--map = sti.new("assets/iso.lua", { "box2d" })

	--map = sti.new("assets/stag.lua",  { "box2d" })
	--map = sti.new("assets/stag2.lua", { "box2d" })
	--map = sti.new("assets/stag3.lua", { "box2d" })
	--map = sti.new("assets/stag4.lua", { "box2d" })

	--map = sti.new("assets/hex.lua",  { "box2d" })
	--map = sti.new("assets/hex2.lua", { "box2d" })
	--map = sti.new("assets/hex3.lua", { "box2d" })
	--map = sti.new("assets/hex4.lua", { "box2d" })

	--map = sti.new("assets/planetcute.lua", { "box2d" })

	-- Print Tiled Version
	print(map.tiledversion)

	-- Print Box2D Plugin Version
	print(map.box2d_VERSION)

	-- Prepare physics world
	world = love.physics.newWorld(0, 0)

	-- Prepare collision objects
	map:box2d_init(world)

	-- Add a Custom Layer
	map:addCustomLayer("Sprite Layer", 3)

	local spriteLayer = map.layers["Sprite Layer"]

	-- Add Custom Data
	spriteLayer.sprite = {
		image = love.graphics.newImage("assets/kim.png"),
		x = 800,
		y = 900
	}

	spriteLayer.sprite.body = love.physics.newBody(world, spriteLayer.sprite.x/2, spriteLayer.sprite.y/2, "dynamic")
	spriteLayer.sprite.body:setLinearDamping(10)
	spriteLayer.sprite.body:setFixedRotation(true)

	spriteLayer.sprite.shape   = love.physics.newRectangleShape(27, 50)
	spriteLayer.sprite.fixture = love.physics.newFixture(spriteLayer.sprite.body, spriteLayer.sprite.shape)

	-- Override Update callback
	function spriteLayer:update(dt)

	end

	-- Override Draw callback
	function spriteLayer:draw()
		local image = self.sprite.image
		local x = math.floor(self.sprite.x)
		local y = math.floor(self.sprite.y)
		love.graphics.draw(image, x, y, r, 1, 1, 14, 25)
	end
end

function love.update(dt)
	-- Make sure to do this or nothign will work!
	world:update(dt)

	-- Update sprite's coordinates
	local sprite = map.layers["Sprite Layer"].sprite
	local down = love.keyboard.isDown

	local x, y = 0, 0
	if down("w") or down("up")		then y = y - 4000 end
	if down("s") or down("down")	then y = y + 4000 end
	if down("a") or down("left")	then x = x - 4000 end
	if down("d") or down("right")	then x = x + 4000 end
	sprite.body:applyForce(x, y)
	sprite.x, sprite.y = sprite.body:getWorldCenter()

	map:update(dt)
end

function love.draw()
	local sprite = map.layers["Sprite Layer"].sprite
	local ww = love.graphics.getWidth()
	local wh = love.graphics.getHeight()
	local tx = math.floor(-sprite.x + ww / 2 - 16)
	local ty = math.floor(-sprite.y + wh / 2 - 16)

	-- Draw sprite in centre of screen
	love.graphics.push()
	love.graphics.translate(tx, ty)
	map:setDrawRange(-tx, -ty, ww, wh)
	map:draw()

	love.graphics.setColor(255, 255, 0, 255)
	map:box2d_draw()

	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.polygon("line", sprite.body:getWorldPoints(sprite.shape:getPoints()))
	love.graphics.pop()

	local dir = "WASD / UDLR to move"
	love.graphics.setColor(255, 0, 0, 255)
	love.graphics.print(dir, 30, 30)
	love.graphics.setColor(255, 255, 255, 255)
end

function love.resize(w, h)
	map:resize(w, h)
end
