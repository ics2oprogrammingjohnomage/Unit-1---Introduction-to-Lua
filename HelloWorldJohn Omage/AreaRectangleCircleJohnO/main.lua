-- Title: AreaOfRectangleAndCircle
-- Name: John Omage
-- Course: ICS2O/3C
-- This program displays a colored rectangle with 
--a border of a different color. it also calculates 
--the rectangle's area and displays it on the screen. 
--Then i added the code to draw a circle off a given 
--radius that i colored and a border of a different 
--color. i used the radius to calculate the area and 
--displayed this on the iPad.

-- create my local variables 
local areaText
local textSize = 50
local myRectangle 
local widthOfRectangle = 350
local heightOfRectanagle = 200
local areaOfRectangle 

-- set the baclgroung colour of my sceeen.
display.setDefault("background", 51/255, 255/255, 153/255)

--remove status bar
display.setStatusBar(display.HiddenStatusBar)

--draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectanagle)

--anchor the rectangle in the top left corner of the screen  and set it s(x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY= 0
myRectangle.x = 20
myRectangle.y = 20

--set the width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectanagle
myRectangle:setFillColor(51/255, 51/255, 255/255)

--set the colour of the border
myRectangle:setStrokeColor(255/255, 51/51, 51/51)

--calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectanagle

--write the area on the screen
areaText = display.newText("The area of the rectangle with a width of \n" ..
	widthOfRectangle .. "and a height of " .. heightOfRectanagle .. "is" ..
	areaOfRectangle .. "pixles².", 0, 0, Arial, textSize)

-- anchor the text and set it s(x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 0
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)