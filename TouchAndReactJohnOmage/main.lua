-- Title: TouchAndReact
-- Name: John Omage
-- Course: ICS2O/3C
-- This program does something when i click on the button

-- set background colour
display.setDefault ("background", 255/255, 128/255, 0/255)

--hide status bar 
display.setStatusBar(display.HiddenStatusBar)

--create blue button, set its position make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

--create red button, set its position make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--create red button, set its position make it invisible
local hii = display.newImageRect("Images/hii.png", 198, 96)
hii.x = display.contentWidth/4
hii.y = display.contentHeight/4
hii.isVisible = false


-- create text object, set its position and make it invisable
local textObject = display.newText ("Clicked!" , 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (51/255, 51/255, 255/255)
textObject.isVisible = false

-- create sound
local buttonSound = audio.loadSound( "Sounds/BruhSoundEffect.mp3")


--Function:BlueButtonListener 
-- Input: touch listener
--Output: none
-- Description: when blue button is clicked, it willl make the text appear with 
--the red button, and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false 
		redButton.isVisible = true
		textObject.isVisible = true
		hii.isVisible = true
		audio.play(buttonSound)

	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		hii.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = false 
		blueButton.isVisible = true
		textObject.isVisible = true
		hii.isVisible = false
	end

	if (touch.phase == "ended") then
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = false
		hii.isVisible = true
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)