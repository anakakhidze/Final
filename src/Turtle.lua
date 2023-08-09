Turtle = Class{}


function Turtle:init(x, y, dx, skin)
	self.skins = {
		['large-turtle'] = love.graphics.newImage('assets/largeturtle.png'),
		['small-turtle'] = love.graphics.newImage('assets/smallturtle.png')
		}
	self.skin = skin
	
	self.x = x
	self.y = y
	
	self.width = self.skins[self.skin]:getWidth()
	self.height = self.skins[self.skin]:getHeight()
	self.dx = dx
end

function Turtle:update(dt)
	self.x = self.x + self.dx * dt * 80
end

function Turtle:render()
	love.graphics.draw(self.skins[self.skin], self.x, self.y)
end
