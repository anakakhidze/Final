River=Class{}


function River:init(x, y)
        self.image = love.graphics.newImage('assets/river.png')
        
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
        
         self.x = 0
         self.y = VIRTUAL_HEIGHT - 240

     
end


function River:render()
          love.graphics.draw(self.image, self.x, self.y)
end
