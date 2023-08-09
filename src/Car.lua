Car = Class{}

function Car:init(x, y, dx, skin)
	self.skins = {
		['truck'] = love.graphics.newImage('assets/truck.png'),
		['yellow-car'] = love.graphics.newImage('assets/yellowcar.png'),
		['white-car'] = love.graphics.newImage('assets/whitecar.png'),
                ['pink-car'] = love.graphics.newImage('assets/pinkcar.png')
		}
	self.skin = skin
	
	self.x = x
	self.y = y
	
	self.width = self.skins[self.skin]:getWidth()
	self.height = self.skins[self.skin]:getHeight()
	self.dx = dx
end

function Car:update(dt)
	self.x = self.x + self.dx * dt * 80
end

function Car:render()
	love.graphics.draw(self.skins[self.skin], self.x, self.y)
end
