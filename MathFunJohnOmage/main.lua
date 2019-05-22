-- Title: MathFun
-- Name: John Omage
-- Course: ICS2O/3C
-- This program does a math fun quiz

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
local roundToFirstDecimal
-- local functions
local function AskQuestion()
 -- make a number from 1 and 2
 randomOperator = math.random(1,4)

 randomNumber1 = math.random(6,10)
 randomNumber2 = math.random(1,6)

 -- if the number is 1 then add
 if (randomOperator == 1) then

-- calculate the correct answer
 correctAnswer = randomNumber1 + randomNumber2

 -- creat question in text object 
 questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

 -- if the number is 2 then take away
 	elseif (randomOperator == 2) then

 	--calculate the correct answer
 	correctAnswer = randomNumber1 - randomNumber2

 	-- make the question in text object
 	questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

 	-- if number is 3 then times
	elseif (randomOperator == 3) then

	-- calculate the correct answer 
	correctAnswer = randomNumber1 * randomNumber2

	-- make question in text object 
	questionObject.text = randomNumber1 .." * " .. randomNumber2 .. " = "
	end
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

-- call the function to ask the question 
local function AskQuestion()
	randomOprator = math.random(1,25)

	-- generate 2 random numbers
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)

	-- if the random opertor is 1,then do addition
	if ( randomOperator == 1) then

		-- create question in he text object
			questionObject.text = randomNumber1 .. " + ".. randomNumber2 .. " = "

		--otherwise, if the random operator is 2 do subtration
		elseif (randomOperator == 2) then
			-- calculate the corrcet answer
			correctAnswer = randomNumber1 - randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 .. "*" .. randomNumber2 .. "="

	-- if the random opertor is 4,then do divison
	if ( randomOperator == 4) then

		-- create question in he text object
			questionObject.text = randomNumber1 .. " / ".. randomNumber2 .. " = "

		end
	end
end

