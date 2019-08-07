#create array of operator symbols and words that will be accepted as commands for the calculator
operators_array = %w[
    + 
    add
    -
    substract
    *
    multiply
    /
    divide
  ]
  
#greet the user

puts "welcome to vi's calculator! what is your first number?"
number1 = gets.chomp

#validating first number is a digit, otherwise prompt for a number again

until number1 =~ /\d/
    puts "enter a number doof!"
    number1 = gets.chomp
end

puts "what is your operation? 
(+) add 
(-) substract 
(*) multiply
(/) divide"

operator = gets.chomp

#check for erroneus operater input 
#validating if the operators array contains the operator variable 
#until user input is valid (contained in array) then prompt the user again 
until operators_array.include?(operator)
    puts "enter an operator from the list above!"
    operator = gets.chomp
end 

puts "what is your second number?"
number2 = gets.chomp

#verify second number is a digit
until number2 =~ /\d/
    puts "enter a number doof!"
    number2 = gets.chomp
end

#for dealing with divide by zero, check if the second number is zero if the operator is division. 
while (operator == "/" || operator == "divide") && number2 == "0"
    puts "ya can't divide by 0 dingus, try again"
    number2 = gets.chomp 
end 

if operator == "+" || operator == "add"
    result = number1.to_i + number2.to_i
elsif operator == "-" || operator == "minus"
    result = number1.to_i - number2.to_i
elsif operator == "*" || operator == "multiply"
    result = number1.to_i * number2.to_i
elsif operator == "/" || operator == "divide"
    result = number1.to_s.to_f / number2.to_s.to_f
end

puts "the result is #{result}"
