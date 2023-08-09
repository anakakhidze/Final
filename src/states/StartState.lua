StartState = Class{__includes = BaseState}


function StartState:init()
       local selected = 1
end

function StartState:update(dt)
	if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
                selected = selected == 1 and 2 or 1
                sounds['buttonchosing']:play()
	end
	
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		  sounds['buttonclick']:play()
	   	if selected == 1 then
		     	stateMachine:change('play')
		  else
		     	love.event.quit()
		  end
			
	        end

end



function StartState:render()

    love.graphics.clear(5/255, 14/255, 65/255, 255/255)
   	
    love.graphics.draw(title,100,60)
    love.graphics.draw(frog,14,45)

     love.graphics.setColor(203/255, 197/255, 197/255, 255/255)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 40 , VIRTUAL_HEIGHT / 2 + 6, 80, 20)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 40 , VIRTUAL_HEIGHT / 2 + 40, 80, 20)

     love.graphics.setColor(7/255, 138/255, 20/255, 255/255)  
     if selected == 1 then
           love.graphics.setColor(185/255, 179/255, 23/255, 255/255) 
     end
     love.graphics.printf("PLAY", 0, VIRTUAL_HEIGHT / 2 + 10 ,
        VIRTUAL_WIDTH, 'center')

	  love.graphics.setColor(7/255, 138/255, 20/255, 255/255)
        
     if selected == 2 then
          love.graphics.setColor(185/255, 179/255, 23/255, 255/255)
     end
     love.graphics.printf("EXIT", 0, VIRTUAL_HEIGHT / 2 + 43,
        VIRTUAL_WIDTH, 'center')

	 love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

	
end


