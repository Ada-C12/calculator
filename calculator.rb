# Methods for each arithmetic operator
def add(num_one, num_two)
  puts "#{num_one} + #{num_two} = #{num_one + num_two}"
end

def subtract(num_one, num_two)
  puts "#{num_one} - #{num_two} = #{num_one - num_two}"
end

def multiply(num_one, num_two)
  puts "#{num_one} * #{num_two} = #{num_one * num_two}"
end

def divide(num_one, num_two)
  puts "#{num_one} / #{num_two} = #{num_one / num_two}"
end

def modulo(num_one, num_two)
  puts "#{num_one} % #{num_two} = #{num = num_one / num_two
         total = num_two * num
         remainder = num_one - total}"
end

def exponent(base_num, exp_num)
  result = 1
  exp_num.times do
    result *= base_num
  end
  puts "#{base_num}^#{exp_num} = #{result}"
end

# Welcome message to user
puts "Welcome to the Calculator program! Which operator would you like to use?
1. add(+)
2. subtract(-)
3. multiply (*)
4. divide (/)
5. modulo (%)
6. exponent (** or ^)"

puts "Please choose one operator(name or symbol):"

# Stores user's input as one of the operators or prints a message telling them to enter a valid operator
while users_operator = gets.chomp.upcase
  case users_operator
  when "ADD", "+"
    break
  when "SUBTRACT", "-"
    break
  when "MULTIPLY", "*"
    break
  when "DIVIDE", "/"
    break
  when "MODULO", "%"
    break
  when "EXPONENT", "**", "^"
    break
  else
    puts "Invalid operator. Please enter a valid operator in order to continue: "
  end
end

puts "Please enter a number:"

# Checks and validates user input. If input is not an integer, an exception is thrown and prompts the user to enter a valid number
begin
  num_one = Integer(gets.chomp) # Question: Is there a way to accept both integers and floats from the user? Would this require conditional statements?
rescue
  puts "Invalid input. Please enter a valid number: "
  retry
end

puts "Please enter another number:"

begin
  num_two = Integer(gets.chomp)
rescue
  puts "Invalid input. Please enter a valid number: "
  retry
end

# Performs calculations based on user input
if users_operator == "ADD" || users_operator == "+"
  add(num_one, num_two)
elsif users_operator == "SUBTRACT" || users_operator == "-"
  subtract(num_one, num_two)
elsif users_operator == "MULTIPLY" || users_operator == "*"
  multiply(num_one, num_two)
elsif users_operator == "DIVIDE" || users_operator == "/"
  if num_two == 0 # If user enters 0 as the second number, an error message is printed and reprompts the user for a greater input
    puts "You cannot divide by 0! Please enter a number greater than 0: "
    num_two = gets.chomp.to_i
    divide(num_one, num_two)
  else
    divide(num_one, num_two)
  end
elsif users_operator == "MODULO" || users_operator == "%"
  modulo(num_one, num_two)
elsif users_operator == "EXPONENT" || users_operator == "**" || users_operator == "^"
  exponent(num_one, num_two)
end
