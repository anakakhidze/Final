Frog = Class{}


function Frog:init(x, y)
        self.image = love.graphics.newImage('assets/frog.png')
        
        self.width = self.image:getWidth()
	self.height = self.image:getHeight()
        
         self.x = x*16
         self.y = y*16

         self.dx = 1,7
         self.dy = 1,7

       --  self.follow = false
         self.go = true
         self.collision = false
       
       
end

function Frog:collides(target)
	if self.x > target.x + target.width or target.x > self.x + self.width then
		return false
	end
	
	if self.y > target.y + target.height or target.y > self.y + self.height then
		return false
	end
	
	return true

end


function Frog:update(dt)
             if self.go then
 
                   if love.keyboard.wasPressed('up') then
                        sounds['jump']:play()
	                self.y = math.max(self.y - self.dy * CELL_SIZE,0)
                   elseif  love.keyboard.wasPressed('down') then
                         sounds['jump']:play()
	                 self.y = math.min(self.y + self.dy * CELL_SIZE, VIRTUAL_HEIGHT - 47)
                   end
                                               
        
 
                   if love.keyboard.wasPressed('right') then
                       sounds['jump']:play()
	               self.x = math.min(self.x + self.dx * CELL_SIZE , VIRTUAL_WIDTH - self.width)
                   elseif  love.keyboard.wasPressed('left') then
                       sounds['jump']:play()
	               self.x = math.max(self.x - self.dx * CELL_SIZE, 0)
                   end
           
            end


        --[[ if self.follow then
               self.x = target.x
               self.y = target.y
          end--]]
                  

end

function Frog:reset()
	      self.x = VIRTUAL_WIDTH / 2
              self.y = VIRTUAL_HEIGHT / 2 + 73
	
end



function Frog:render()
          love.graphics.draw(self.image, self.x, self.y)
end
