-- Title: WhackAMole
-- Name: John Omage
-- Course: ICS2O/3C
-- This program...

display.setStatusBar(display.HiddenStatusBar)

-- Creating Background
local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight)

--set the background colour of my screen.
display.setDefault("background", 255/255, 128/255, 0/255)

--sounds
local hitSound = audio.loadSound("Sounds/boing.mp3")
local hitSoundChannel
local backgroundMusic = audio.loadSound("Sounds/star.wav")
local backgroundMusicChannel

-- Bkg Music
backgroundMusicChannel = audio.play(backgroundMusic)

-- Setting Position 
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.g = 0

--Creating sam
local sam = display.newImage( "Images/sam.png" , 0, 0 )

-- Setting position
sam.x = display.contentCenterX
sam.y = display.contentCenterY

sam:scale(2/4, 2/4)

-- make sam invisible
sam.invisible = false

-- Score
local score = 0

-- Add text 
local scoreObject = display.newText("Score: ", display.contentWidth/6, display.contentHeight)
scoreObject:setTextColor(0/255, 255/255, 125/255)
---------------------------------------------------------
---functions
----------------------------------------------------------\
--makes the mole appear random
function PopUp()
	-- choosing random positions
	sam.x = math.random( 0, display.contentWidth)
	sam.y = math.random( 0, display.contentHeight)

	-- make sam visible
	sam.invisible = true

	-- call it 400 millisecounds later
	timer.performWithDelay( 400, Hide)
end

-- calls the PopUp function
function PopUpDelay()
	timer.performWithDelay( 3000, PopUp )
end

-- makes the mole invisible
function Hide()

	-- change visibility
	sam.invisible = false

	-- call the PopUpDelay
	PopUpDelay()
end

-- Starts the game
function GameStart()
	PopUpDelay()
end

-- when sam is clicked theres a new score

function Whacked( event )

-- If touch start
if (event.phase == "began") then
	score = score + 1
	scoreObject.text = "Score: " .. score
	hitSoundChannel = audio.play(hitSound)
end
end


---event
sam:addEventListener( " touch", Whacked)

-- game start

GameStart()