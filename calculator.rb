# Ga-Young Jin, Cohort 12
# Tuesday, August 6th, 2019
# Week 1

# intro to the program, ask user to pick an operator
puts "Welcome to the calculator program! Which operator would you like to use? Please enter the name or symbol."
puts "1. add (+)
2. subtract (-)
3. multiply (*)
4. divide (/)"

command = gets.chomp.downcase # save input to command

puts "Please enter the first number for the math operation."
numone = gets.chomp # ask user for first number and save

puts "Please enter the second number for the math operation."
numtwo = gets.chomp # ask user for second number and save

# does not work for floats or negative numbers
# method to check number inputs for any non-digit
def checknums(a)
  a.scan(/\D/).empty?
end

def sum(a, b) # method to sum two numbers
  return a + b
end

def sub(a, b) # method to subtract two numbers
  return a - b
end

def mul(a, b) # method to multiply two numbers 
  return a * b
end

def div(a, b) # method to divide two number 
  return a / b
end

if checknums(numone) == false || checknums(numtwo) == false || numone == "" || numtwo == "" # check numbers to validity
  puts "You did not enter valid numbers. Exiting program now."
else
  numone = numone.to_f # if numbers are valid, convert to floats
  numtwo = numtwo.to_f
  
  # compare command to the following "when"s and complete the block if same
  case command
  when "add", "+" 
    result = sum(numone, numtwo)
    puts "#{numone} + #{numtwo} = #{result}"
  when "subtract", "-"
    result = sub(numone, numtwo)
    puts "#{numone} - #{numtwo} = #{result}"
  when "multiply", "*"
    result = mul(numone, numtwo)
    puts "#{numone} * #{numtwo} = #{result}"
  when "divide", "/"
    if numtwo == 0.0 
      puts "You cannot divide by 0. Exiting program now."
    else 
      result = div(numone, numtwo)
      puts "#{numone} / #{numtwo} = #{result}"
    end
  else
    puts "You did not enter a valid operation. Exiting program now."
  end
end
