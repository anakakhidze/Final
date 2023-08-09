push = require 'libraries/push'
Class = require 'libraries/class'

require 'src/Frog'
require 'src/Car'
require 'src/Turtle'
require 'src/Log'
require 'src/Leaf'
require 'src/River'


require 'src/states/StateMachine'
require 'src/states/BaseState'
require 'src/states/StartState'
require 'src/states/PlayState'
require 'src/states/WinState'
require 'src/states/ScoreState'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 240

CELL_SIZE = 20

--FROG_SPEED = 3



function love.load()
      
       grass = love.graphics.newImage('assets/grass.png')
       river = love.graphics.newImage('assets/river.png')
       purplepart = love.graphics.newImage('assets/purplepart.png')
       frog = love.graphics.newImage('assets/froglogo.png')
       title =love.graphics.newImage('assets/title.png')
      
      
	io.stdout:setvbuf("no")
	
        love.graphics.setDefaultFilter('nearest', 'nearest')
       
        love.window.setTitle('frogger')
        
        math.randomseed(os.time())

        font = love.graphics.newFont('fonts/font1.ttf', 15)
        

	love.graphics.setFont(font)	

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})
	

	stateMachine =  StateMachine {
                ['start'] = function() return StartState() end,
                ['play'] = function() return PlayState() end,
                ['score'] = function() return ScoreState() end,
                ['win'] = function() return WinState() end
	}
	
	stateMachine:change('start')
     
        sounds = {
	        ['buttonchosing'] = love.audio.newSource('sounds/buttonchosing.wav', 'static'),
	        ['buttonclick'] = love.audio.newSource('sounds/buttonclick.wav', 'static'),	
	        ['jump'] = love.audio.newSource('sounds/jump.wav', 'static'),
                ['win'] = love.audio.newSource('sounds/win.wav', 'static'),
                ['fail'] = love.audio.newSource('sounds/fail.wav', 'static'),
                ['music'] = love.audio.newSource('sounds/music.mp3', 'static')
	}

      
                   sounds['music']:setLooping(true)
                   sounds['music']:setVolume(0.1)
                   sounds['music']:play()
            
      


        love.keyboard.keysPressed = {}
       
end

function love.update(dt)
       stateMachine:update(dt)
       
      love.keyboard.keysPressed = {}
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true
	
	if key == 'escape' then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end

	

function love.draw()
	push:start()
	             
       
        stateMachine:render()
            
	
	push:finish()
end
