-- Title: TouchAndDrag
-- Name: John Omage
-- Course: ICS2O/3C
-- This program has two images on the screen 
--when i click and drag on each image it moves 
--with my finger

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables. x-value to be set properly
local background = display.newImageRect("Images/background.png", 2048, 1536)
local girl1 = display.newImageRect("Images/girl1.png", 150, 150)
local girl1Width = girl1.width
local girl1Height = girl1.height


local girl2 = display.newImageRect("Images/girl2.png", 150, 150)
local girl2Width = girl2.width
local girl2Height = girl2.height

local girl3 = display.newImageRect("Images/girl3.png", 150, 150)
local girl3Width = girl3.width
local girl3Height = girl3.height

-- my boolean variables to keep track of which object I touched first 
local alreadyTouchedgirl1 = false 
local alreadyTouchedgirl2 = false
local alreadyTouchedgirl3 = false

-- set the initial x and y position of myImage
girl1.x = 400
girl1.y = 500

girl2.x = 300
girl2.y = 200

girl3.x = 600
girl3.y = 200
--Function: BlueGirlListener
-- Input: touch listener
--Output: none
--Description: when girl2 is touched move her 
local function girl2Listener (touch)

	if (touch.phase == "began") then
		if (alreadyTouchedgirl1 == false) then
			alreadyTouchedgirl2 = true
			alreadyTouchedgirl3 = false
		end
	end

	if ( ( touch.phase == "moved") and (alreadyTouchedgirl2 == true) ) then
		girl2.x = touch.x
		girl2.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedgirl2 = false
		alreadyTouchedgirl1 = false 
		alreadyTouchedgirl3 = false 
	end
end

-- add the respective listeners to each object 
girl2: addEventListener("touch", girl2Listener)

local function girl1Listener (touch)

	if (touch.phase == "began") then
		if (alreadyTouchedgirl2 == false) then
			alreadyTouchedgirl1 = true
			alreadyTouchedgirl3 = false
		end
	end

	if ( ( touch.phase == "moved") and (alreadyTouchedgirl1 == true) ) then
		girl1.x = touch.x
		girl1.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedgirl1 = false
		alreadyTouchedgirl2 = false 
		alreadyTouchedgirl3 = false 
	end
end

-- add the respective listeners to each object 
girl1: addEventListener("touch", girl1Listener)

local function girl3Listener (touch)

	if (touch.phase == "began") then
		if (alreadyTouchedgirl2 == false) then
			alreadyTouchedgirl3 = true
			alreadyTouchedgirl1 = false
		end
	end

	if ( ( touch.phase == "moved") and (alreadyTouchedgirl3 == true) ) then
		girl3.x = touch.x
		girl3.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedgirl3 = false
		alreadyTouchedgirl2 = false 
		alreadyTouchedgirl1 = false 
	end
end

-- add the respective listeners to each object 
girl3: addEventListener("touch", girl3Listener)