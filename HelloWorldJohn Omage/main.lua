-- Title: HelloWorld
-- Name: John Omage
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.
-------------------------------------------------------------------------------

-- print "Hello, There" to the command terminal
print ("***Hello John!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- seta the background colour
display.setDefault("background", 255/255, 128/255, 0/255)

--create a local variable
local textObject

--displays text on the screen at position x500 and y = 335 with
-- a deafult font style and font size of 55
textObject = display.newText( "Hello, John!", 500, 335, nil, 55 )

--sets the color of the text
textObject:setTextColor(255/255, 255/255, 255/255)

--create a local variable
local textObjectSignature

--displays text on the screen at position x500 and y = 335 with
-- a deafult font style and font size of 55
textObjectSignature = display.newText( "Created by John Omage", 456, 456, nil, 30 )

--sets the color of the text
textObject:setTextColor(51/255, 51/255, 255/255)