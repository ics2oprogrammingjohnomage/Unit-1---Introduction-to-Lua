-- Title: MovingImages
-- Name: John Omage
-- Course: ICS2O/3C
-- This program moves a battleship across
-- the screen and then makes it fades out.
-- i added another object that move in a 
-- diffenrent direction as well as a background
-- image

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--global variables
scrollSpeed = 1

-- background image with width and height 
local backgroundImage = display .newImageRect("Images/background.png", 2048, 1536)

--character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 400, 400)

--set image to be transparent
beetleship.alpha = 400

-- ser the initial x and y position of beetles500
beetleship.x = 200
beetleship.y = 165
--function : Moveship 
-- Input: tis function accepts and event listener 
-- Output: none 
-- Description: This fuction and adds the scrol speed to the x-value of the ship 
local function MoveShip(event)
	-- add the scroll speed to th ex-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of th e ship every time it moves so that it fades out 
	beetleship.alpha = beetleship.alpha + 0.01
end

-- create event listeners 
	Runtime:addEventListener("enterFrame", MoveShip)

	--global variables
 NewScrollSpeed = -2
	
--character image with width and height
local rocketship = display.newImageRect("Images/rocketship.png", 200, 400)

--set image to be transparent
rocketship.alpha = 400

-- set the initial x and y position of rocketship
rocketship.x = 800
rocketship.y = 600
--function : Moveship 
-- Input: tis function accepts and event listener 
-- Output: none 
-- Description: This fuction and adds the scroll speed to the x-value of the ship 
local function Moverocketship(event)

	--rotate image
	rocketship:rotate(190)
		-- move the image
	rocketship.x = rocketship.x + NewScrollSpeed
	-- change the transparency of th e ship every time it moves so that it fades out 
	rocketship.alpha = rocketship.alpha + 0.01
end
-- create event listeners 
	Runtime:addEventListener("enterFrame", Moverocketship)