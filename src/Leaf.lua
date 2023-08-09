Leaf = Class{}


function Leaf:init(x, y)
        self.image = love.graphics.newImage('assets/leaf.png')	
	
        self.x = x
        self.y = y
	
	self.width = self.image:getWidth()
        self.height = self.image:getHeight()
	
end



function Leaf:render()
	love.graphics.draw(self.image, self.x, self.y)
end
