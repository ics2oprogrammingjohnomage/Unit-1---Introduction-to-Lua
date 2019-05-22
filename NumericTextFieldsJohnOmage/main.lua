-- Title: NumericTextFields
-- Name: John omage
-- Course: ICS2O/3C
-- This program use numeric text fields to receive input
-- and tell the user if they got the answer correct 
--or incorrect

display.setStatusBar(display.HiddenStatusBar)

--set the background colour of my screen.
display.setDefault("background", 255/255, 128/255, 0/255)

-- create local variables
local questionObject
local correctObject
local NumericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local incorrectObject

-- local functions
local function AskQuestion()
	-- generate 2 randon numbers between a max. and a min. number
	randomNumber1 = math.random(10, 26)
	randomNumber2 = math.random(10, 26)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if (event.phase == "began") then

		--clear text field
		event.target.text = ""

		elseif (event.phase == "submitted") then

			-- when the answer is sumitted ( enter key is pressed)
			userAnswer = tonumber(event.target.text)

			-- if the users answer and the carrect answer are the same:
			if (userAnswer == correctAnswer) then
				correctObject.isVisible = true
				incorrectObject.isVisible = false
				timer.performWithDelay(2000, HideCorrect)

			elseif (userAnswer ~= correctAnswer) then
				incorrectObject.isVisible = true
				correctObject.isVisible = false
				timer.performWithDelay(2000, HideCorrect)
			end
		end
	end

-- OBJECT CREATION

--displays a question and set the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil,50 )
questionObject:setTextColor(0/255, 0/255, 0/255)


-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/3, display.contentHeight*2/3, nil,50 )
correctObject:setTextColor(51/255, 51/255, 255/255)
correctObject.isVisible = false

-- create the correct text object and make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/3, display.contentHeight*2/3, nil,50 )
incorrectObject:setTextColor(51/255, 51/255, 255/255)
incorrectObject.isVisible = false

-- Create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

-- FUNCTION CALLS	
AskQuestion()

HideCorrect()