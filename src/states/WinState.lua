WinState = Class{__includes = BaseState}

function WinState:enter(params)
	self.score = params.score
end

function WinState:render()
        love.graphics.clear(20/255, 0/255, 100/255, 0/255)
	
	love.graphics.draw(purplepart, 0, VIRTUAL_HEIGHT - 52)
        love.graphics.draw(purplepart, 0, VIRTUAL_HEIGHT - 152)
        love.graphics.draw(river, 0, VIRTUAL_HEIGHT - 240)
        love.graphics.draw(grass, 0,0 )

        love.graphics.setColor(10/255, 215/255, 44/255, 255/255)
	love.graphics.printf('Won!', 0, 120, VIRTUAL_WIDTH, 'center')

        love.graphics.setColor(253/255, 253/255, 253/255, 255/255)
        love.graphics.printf('press enter to play again', 0, 160, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Score: '.. tostring(self.score), 0, 140, VIRTUAL_WIDTH, 'center')

end

	
function WinState:update(dt)
    if love.keyboard.isDown('return') then
         stateMachine:change('start')
    end
end
        
      
