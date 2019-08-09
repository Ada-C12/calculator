# Define data structures
operators = {
  "add": "+",
  "+": "+",
  "subtract": "-",
  "-": "-",
  "multiply": "*",
  "*": "*",
  "divide": "/",
  "/": "/",
  "modulo": "%",
  "%": "%",
  "exponent": "**",
  "^": "**"
}

# Method to print all valid operators
def print_operators
  puts "1. Add (+)"
  puts "2. Subtract (-)"
  puts "3. Multiply (*)"
  puts "4. Divide (/)"
  puts "5. Modulo (%)"
  puts "6. Exponent (^)"
  print "\nPlease choose an operator (name or symbol): "
end

# Method to keep requesting input until a valid operator is entered
def error_message_operators(input, valid_input)
  until valid_input.keys.include? input.to_sym
    puts "Oops! Your input was invalid. Your options are:"
    print_operators
    input = gets.chomp
  end
  return input
end

# Method to keep requesting input until a number is entered
def error_message_numbers(input)
  while input == nil
    puts "Oops! Your input was invalid. Please enter a number: "
    input = Float(gets) rescue nil
  end
  return input
end

# Greet the user
puts "Welcome to your handy dandy calculator! Which operator would you like to use?"
print_operators

# Check user-input operator for validity and store valid operator
chosen_operator = gets.chomp.downcase
chosen_operator = error_message_operators(chosen_operator, operators)

print "\nPlease enter your first number: "

# Check user-input numbers for validity and store valid numbers
chosen_number_1 = Float(gets) rescue nil
chosen_number_1 = error_message_numbers(chosen_number_1)

print "\nPlease enter your second number: "

chosen_number_2 = Float(gets) rescue nil
chosen_number_2 = error_message_numbers(chosen_number_2)

# Call the selected operator method with the user's selected number arguments
# Store the resulting value as the answer
# Note: operators are methods (send reads the given string as a method)
answer = chosen_number_1.send(operators[:"#{chosen_operator}"], chosen_number_2)

# Adjust answer appropriately if user is dividing by 0
if operators[:"#{chosen_operator}"] == "/" && chosen_number_2 == 0
  answer = "infinity"
end

# Print the resulting formula and outcome
puts "#{chosen_number_1} #{operators[:"#{chosen_operator}"]} #{chosen_number_2} = #{answer}"
puts "The answer is #{answer}!"

puts "\nThank you for using the calculator!"
