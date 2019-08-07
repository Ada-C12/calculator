# build a calculator interface that allows the user to input info to perform simple arithmetic.
# use the input operation and two numbers to provide the results.
# accept both the name and the symbol for each possible operation. 

puts "\nWelcome to the CALCULATOR program, which operator would you like to use?"
puts """\nOptions:
1. add or +
2. subtract or -
3. multiply or *
4. divide or /"""

# handle unexpected input for operations and numbers.
# optional: add support for handling all cases (uppercase, capitals) for the operations.
# optional: output a message that informs the user that the input was invalid.
# optional: asks the user to re-enter the input for the same prompt.
# optional: does this until the input is valid.
# optional: uses the newer, valid input.

operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

print "\nPlease choose one operator (name or symbol): "
option =  gets.chomp.downcase

until operations.include?(option)
  puts "INVALID INPUT, SORRY... Try again.\n"
  print "\nPlease choose one operator (name or symbol): "
  option =  gets.chomp.downcase
end

# handle unexpected input for numbers (expected 0, positive and negative numeric input).
# Optional: output a message to the command line that informs the user that the input was invalid.
# Optional: asks the user to re-enter the input for the same prompt.
# Optional: does this until the input is valid.
# Optional: uses the newer, valid input.

puts "\nAttention! This CALCULATOR works with two numbers at a time."

print "Please input the FIRST number: "
num1 = gets.chomp
while (num1.to_i.to_s != num1.strip)
  puts "\nINVALID INPUT, SORRY... Try again."
  print "Please input the FIRST number: "
  num1 = gets.chomp
end
num1 = num1.to_f

print "Please input the SECOND number: "
num2 = gets.chomp
while (num2.to_i.to_s != num2.strip)
  puts "\nINVALID INPUT, SORRY... Try again."
  print "Please input the SECOND number: "
  num2 = gets.chomp
end  
num2 = num2.to_f

# handle divide when attempting to divide by zero (just exit the program).
# make your program know when it needs to return an integer versus a float.

if option == "add" || option == "+"
  puts "\nTOTAL: #{(num1 + num2)}"
elsif option == "subtract" || option == "-"
  puts "\nTOTAL: #{(num1 - num2)}"
elsif option == "multiply" || option == "*"
  puts "\nTOTAL: #{(num1 * num2)}"
elsif option == "divide" || option == "/"
  if num2 == 0 
    puts "You can't divide by 0. Sorry...\n"
    exit
  else  
    puts "\nTOTAL: #{(num1 / num2)}"
  end 
end

puts "\n"
