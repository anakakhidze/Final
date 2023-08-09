PlayState = Class{__includes = BaseState}

function PlayState:init()
        
        froglive = love.graphics.newImage('assets/froglive.png')
      
      	self.frog = Frog(13,12)
        self.yellowCars= {}
        self.whiteCars2 = {}
        self.whiteCars1 = {} 
        self.pinkCars = {} 
        self.trucks = {}   
        self.largeTurtles = {} 
        self.smallTurtles = {}
        self.logs = {}    
        self.river = River()
           
        self.leaves = {}
        list = { 20, 115, 210, 305, 400 }       
        x = list[love.math.random( #list )] 
        y = 10
        table.insert(self.leaves, Leaf(x,y))
                    
      
        self.timers = {
        	['cars'] = 3,
        	['turtles'] = 4
        }
       
        self.score = 0
           
        health = 3
end


function PlayState:update(dt)

                   self.frog:update(dt)
                
	           self.timers['cars'] = self.timers['cars'] + dt
	            
	           if self.timers['cars'] > 2 then
                      local x = VIRTUAL_WIDTH -24
	              local y = VIRTUAL_HEIGHT-70
                      table.insert(self.yellowCars, Car(x, y, -1.8, 'yellow-car'))

                      x = -15
                      y = VIRTUAL_HEIGHT - 88
                      table.insert(self.whiteCars1, Car(x, y, 1.5, 'white-car'))

                      x = VIRTUAL_WIDTH + 10
	              y = VIRTUAL_HEIGHT - 106
		      table.insert(self.trucks, Car(x, y, -1.3, 'truck'))
 
                      x = -30
                      y = VIRTUAL_HEIGHT-128
		      table.insert(self.whiteCars2, Car(x, y, 2, 'white-car'))
                      
                     self.timers['cars'] = 0
            end


            self.timers['turtles'] = self.timers['turtles'] + dt
	            
            if self.timers['turtles'] > 2 then
                      x = VIRTUAL_WIDTH + 10
	              y = VIRTUAL_HEIGHT - 169
                      table.insert(self.largeTurtles, Turtle(x, y, -2, 'large-turtle'))

                      x = -20
                      y = VIRTUAL_HEIGHT - 188
		       table.insert(self.logs, Log(x, y))

                      x = VIRTUAL_WIDTH + 20
                      y = VIRTUAL_HEIGHT - 207
                      table.insert(self.smallTurtles, Turtle(x, y, -1.5, 'small-turtle'))

                      self.timers['turtles'] = 0
                      
	          end
	           
	        

                  local collided = false

                  for k, yellowCar in pairs(self.yellowCars) do 
                     yellowCar:update(dt)                    	            
                     if self.frog:collides(yellowCar) and not collided then
                           collided = true
                           sounds['fail']:play()
                           health = health - 1                          

                           if health <= 0 then
                               stateMachine:change('score',{
		                score = self.score
			        })  
                           else
                                 self.frog:reset()
                           end
                      end
                     
                   end

                

                 if love.keyboard.wasPressed('up') and self.frog.y < VIRTUAL_HEIGHT-86  then
                         self.score = self.score +10
                 end


                 for k, whiteCar1 in pairs(self.whiteCars1) do
		      whiteCar1:update(dt)
                      if self.frog:collides(whiteCar1) then
                           collided = true
                           sounds['fail']:play()                          
                           health = health - 1                            

                           if health <= 0 then
                               stateMachine:change('score',{
				  score = self.score
			        })  
                           else
                                 self.frog:reset()
                           end
                      end   
	         end


                 for k, truck in pairs(self.trucks) do
                      truck:update(dt)
                      if self.frog:collides(truck) then
                          collided = true
                           sounds['fail']:play()
                           health = health - 1
                         
                           if health <= 0 then
                               stateMachine:change('score',{
                               score = self.score
			        })  
                           else
                                 self.frog:reset()
                           end
                      end
	        end


                for k, whiteCar2 in pairs(self.whiteCars2) do                     
                     whiteCar2:update(dt)
                     if self.frog:collides(whiteCar2) then
                          collided = true
                           sounds['fail']:play()
                           health = health - 1
                           
                           if health <= 0 then
                               stateMachine:change('score',{
			        score = self.score
			       })  
                           else
                                self.frog:reset()
                           end
                     end                      
                 end




                 for k, largeTurtle in pairs(self.largeTurtles) do
                          largeTurtle:update(dt) 
                          if self.frog:collides(largeTurtle) then 
                              -- self.frog.follow = true                                             
   	        	         self.frog.x = largeTurtle.x  
                             
                          end
                    
                 end

	       
                  
 
                 for k, log in pairs(self.logs) do                     
	                    log:update(dt)   
                     if self.frog:collides(log) then                                                  
   	        	     self.frog.x = log.x  
                           
                     end                  
                 end


                 for k, smallTurtle in pairs(self.smallTurtles) do
                      smallTurtle:update(dt)
                      if self.frog:collides(smallTurtle) then                                                    
   	        	      self.frog.x = smallTurtle.x 
                             
                      end
	         end 


                 if self.frog.x < 0 or self.frog.x > VIRTUAL_WIDTH then
                              sounds['fail']:play()
                              health = health - 1
                             
                              if health <= 0 then
                               stateMachine:change('score',{
			         score = self.score
			         })  
                              else
                                 self.frog:reset() 
                              end
                 end



                 for k, leaf in pairs(self.leaves) do
                       if self.frog:collides(leaf) then  
                           sounds['win']:play()    
                           stateMachine:change('win',{
		             score = self.score
			     })
                       elseif self.frog.y < VIRTUAL_HEIGHT - 220 then
                           collided = true
                           sounds['fail']:play()
                           health = health - 1
                        
                           if health <= 0 then
                               stateMachine:change('score',{
			       score = self.score
			         })  
                           else
                                 self.frog:reset()
                           end

                       end 
                  end

            

                 if self.frog:collides(self.river) then
                        local onTop = false
                        for k, largeTurtle in pairs(self.largeTurtles) do
                             if self.frog:collides(largeTurtle) then
                                    onTop = true
                                    break
                             end
                         end

                        if not onTop then
                            for k, log in pairs(self.logs) do
                                if self.frog:collides(log) then
                                      onTop = true
                                      break
                                 end
                            end
                        end

                        if not onTop then
                            for k, smallTurtle in pairs(self.smallTurtles) do
                                if self.frog:collides(smallTurtle) then
                                      onTop = true
                                      break
                                 end
                            end
                        end


                        if not onTop  then
                              sounds['fail']:play()
                              health = health - 1
                              self.score = 0

                              if health <= 0 then
                               stateMachine:change('score',{
			         score = self.score
			          })  
                              else
                                 self.frog:reset()     
                              end                              
                        end
                         
                end
                          
             
end


function PlayState:render()
      love.graphics.clear(20/255, 0/255, 100/255, 0/255)
	
      love.graphics.draw(purplepart, 0, VIRTUAL_HEIGHT - 52)
      love.graphics.draw(purplepart, 0, VIRTUAL_HEIGHT - 152)
      self.river:render()
      love.graphics.draw(grass, 0,0 )

       love.graphics.print('Score: '.. tostring(self.score), 0, VIRTUAL_HEIGHT - 30) 
		
       for k, largeTurtle in pairs(self.largeTurtles) do
		      largeTurtle:render()
       end
       

       for k, yellowCar in pairs(self.yellowCars) do
		      yellowCar:render()
                   
       end

       for k, whiteCar1 in pairs(self.whiteCars1) do
		      whiteCar1:render()
       end

       for k, truck in pairs(self.trucks) do
		      truck:render()
       end

       for k, whiteCar2 in pairs(self.whiteCars2) do                     
	             whiteCar2:render()                     
       end

       for k, log in pairs(self.logs) do                     
	             log:render()                     
       end

      for k, smallTurtle in pairs(self.smallTurtles) do
		      smallTurtle:render()
	         end
    
      for k, leaf in pairs(self.leaves) do                     
                 leaf:render()              
      end

    

       self.frog:render()
   
        
	local x = VIRTUAL_WIDTH - 60
       
	for i = 1, health do
		love.graphics.draw(froglive, x, VIRTUAL_HEIGHT-27)
		x = x + 20
	end
	
end


