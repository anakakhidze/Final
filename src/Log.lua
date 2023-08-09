Log = Class{}


function Log:init(x,y)
        self.image = love.graphics.newImage('assets/log.png')

       	self.x = x
	self.y = y
	
        self.width = self.image:getWidth()
	self.height = self.image:getHeight()

        self.dx = 100
       
    
end

function Log:update(dt)
	
     self.x = self.x + self.dx * dt   
   	
   
end


function Log:render()
	love.graphics.draw(self.image, self.x, self.y)
end
