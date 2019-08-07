# Ada C12 - Tiffany Chio
# This is the long way of making Ruby perform as a calculator.
# The program prompts for an operator and two operands.
# Then prints the answer.

# Validation function for the operator
# The user input must match one of pre-defined keywords/symbols.
# Will print error message and prompt for a new input until a valid one is obtained.
def val_operation(operation)
  valid = false
  while valid == false
    if ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "exponent", "^", "modulo", "%"].include? operation
      valid = true
    else
      puts ""
      puts "That is not a valid operator. Please try again."
      print "Please choose one operator(name or symbol): "
      operation = gets.chomp.downcase
    end
  end
  return operation
end

# Operand validation function.
# Checking that the input is a valid number.
# Will print error message and prompt for a new input until a valid one is obtained.
# Will also return either int or float as appropriate.
def val_number(number, prompt)
  valid = false

  # Function determines if the user entered an int or float by checking
  # for the prescence of a decimal point.
  # Converts string input into appropriate class and returns that value.
  # If...the number is a float
  if number.match?(/\.+/)
    while valid == false
      converted = number.to_f.to_s
      if converted == number
        valid = true
      else
        puts ""
        puts "That is not a number. Please try again."
        print prompt
        number = gets.chomp
      end
    end
    return number.to_f
    # Else...the number is an int
  else
    while valid == false
      converted = number.to_i.to_s
      if converted == number
        valid = true
      else
        puts ""
        puts "That is not a number. Please try again."
        print prompt
        number = gets.chomp
      end
    end
    return number.to_i
  end
end

puts `clear`

# Gives users options to select from.
puts "Welcome to the Calculator program! Which operator would you like to choose?"
puts "1. add(+)"
puts "2. subtract(-)"
puts "3. multiply(*)"
puts "4. divide(/)"
puts "5. exponent(^)"
puts "6. modulo(%)"

puts ""

# Collects user input for operator.
# User input goes through operator validation function.
print "Please choose one operator(name or symbol): "
operation = gets.chomp.downcase
operation = val_operation(operation)

puts ""

# Collects user input for the first operand.
# User input goes through operand validation function.
print "Please enter a number for the math operation: "
operand_1 = gets.chomp
operand_1 = val_number(operand_1, "Please enter a number for the math operation: ")

puts ""

# Collects user input for the second operand.
# User input goes through operand validation function.
print "Please enter a second number for the math operation: "
operand_2 = gets.chomp
operand_2 = val_number(operand_2, "Please enter a second number for the math operation: ")

# In cases of division or modulus, second operand cannot be zero.
# Validation function for operands does not check for this case.
# Code below will print error message and prompt for a new input
# until a valid non-zero value is obtained.
if ["divide", "/", "modulo", "%"].include? operation
  while operand_2 == 0
    puts ""
    puts "You cannot divide by zero. The result will be undefined."
    print "Please pick another divisor: "
    operand_2 = gets.chomp
    operand_2 = val_number(operand_2, "Please enter a second number for the math operation: ")
  end
end

puts ""

# Print out the formula in addition to the result, i.e. 2 + 2 = 4
# Math is performed within the string interpolation.
case operation
when "add", "+"
  puts "#{operand_1} + #{operand_2} = #{operand_1 + operand_2}"
when "subtract", "-"
  puts "#{operand_1} - #{operand_2} = #{operand_1 - operand_2}"
when "multiply", "*"
  puts "#{operand_1} * #{operand_2} = #{operand_1 * operand_2}"
when "divide", "/"
  puts "#{operand_1} / #{operand_2} = #{operand_1 / operand_2}"
when "exponent", "^"
  puts "#{operand_1}^#{operand_2} = #{operand_1 ** operand_2}"
when "modulo", "%"
  puts "#{operand_1} % #{operand_2} = #{operand_1 % operand_2}"
end
