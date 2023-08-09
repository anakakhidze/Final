ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
	self.score = params.score
end


function ScoreState:init()
  
end

function ScoreState:update(dt)
	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		stateMachine:change('start')
                self.Score = 0
	end
end


function ScoreState:render()
        love.graphics.clear(20/255, 0/255, 100/255, 0/255)
	
	love.graphics.draw(purplepart, 0, VIRTUAL_HEIGHT - 52)
        love.graphics.draw(purplepart, 0, VIRTUAL_HEIGHT - 152)
        love.graphics.draw(river, 0, VIRTUAL_HEIGHT - 240)
        love.graphics.draw(grass, 0,0 )

       
         love.graphics.setColor(219/255, 19/255, 19/255, 255/255)
	 love.graphics.printf('Game over!', 0, 120, VIRTUAL_WIDTH, 'center')

     
        love.graphics.setColor(253/255, 253/255, 253/255, 255/255)
        love.graphics.printf('press enter to play again', 0, 160, VIRTUAL_WIDTH, 'center')
      	love.graphics.printf('Score: '.. tostring(self.score), 0, 140, VIRTUAL_WIDTH, 'center')
end