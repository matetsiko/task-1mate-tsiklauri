function add(x, y)
	return x + y
end

function subtract(x, y)
	return x - y
end

function multiply(x, y)
	return x * y
end

function divide(x, y)
	if y == 0 then
		print("Error: Division by zero is not allowed.")
		return x
	end
	return x / y
end

function square(x)
	return x * x
end

function squareRoot(x)
	if x < 0 then
		print("Error: Cannot take the square root of a negative number.")
		return x
	end
	return math.sqrt(x)
end

maths = {
	['+'] = add,
	['-'] = subtract,
	['*'] = multiply,
	['/'] = divide,
	['^2'] = square,
	['%'] = squareRoot
}

local number = 0

print('Calculator: Enter "done" to quit.')

while true do
	print('Current number: ' .. number)
	
	if number == 0 then
		print('Pick the starting number')
		number = tonumber(io.read())
		if number == nil then
			print('Invalid input. Please enter a valid number.')
			number = 0
		end
	else
		print('Pick an operation (+, -, *, /, ^2 for square, %) or "done" to exit')
		local operation = io.read()
		
		if operation == 'done' then
			break
		elseif maths[operation] then
			if operation == '^2' or operation == '%' then
				number = maths[operation](number)
			else
				print('Pick a second number')
				local secondNumber = tonumber(io.read())
				if secondNumber == nil then
					print('Invalid input. Please enter a valid number.')
				else
					number = maths[operation](number, secondNumber)
				end
			end
		else
			print('Invalid operation. Please enter a valid operation (+, -, *, /, ^2 for square, % for square root) or "done" to exit.')
		end
	end
end
