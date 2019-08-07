# add numbers 
def add(first_num, second_num)
  return (first_num) + (second_num)
end 

# subtract numbers
def subtract(first_num, second_num)
  return (first_num) - (second_num)
end 

# multiply numbers 
def multiply(first_num, second_num)
  return (first_num) * (second_num)
end 

# divide numbers 
def divide(first_num, second_num)
  if second_num == 0
    puts "You can't divide by zero."
    exit 
  else
    return (first_num / second_num)
  end
end 

# checking if the string from the beginning to the end contains only digits one or more times 
def check_valid_number(user_number)
  # if user input contains a digit, convert to an integer. otherwise, display error message
  if /^\d+$/.match(user_number)
    return user_number.to_i
  else 
    puts "That's not a valid number. Try again."
    exit 
  end 
end 

# ask user for math operation
puts "Welcome to the calculator program!"
puts "Please enter two numbers to work with."

# ask user first number for math operation
puts "First number:"
first_num = check_valid_number(gets.chomp)

# ask user second number for math operation
puts "Second number:"
second_num = check_valid_number(gets.chomp)

# ask user for operation and display options
puts "Please choose one operator:"
puts "add (+)"
puts "subtract (-)"
puts "multiply (*)"
puts "divide (/)"

operator = gets.chomp

# if user enters string, convert to lowercase - might not be necessary, because operators entered 
if operator.respond_to?(:to_s)
  operator = operator.downcase
end 

# validate the operator user entered and call operation functions 
case operator 
when "add", "+"
  puts "You chose addition."
  puts "Result: #{add(first_num, second_num)}"
when "subtract", "-"
  puts "You chose subtraction."
  puts "Result: #{subtract(first_num, second_num)}"
when "multiply", "*"
  puts "You chose multiplication."
  puts "Result: #{multiply(first_num, second_num)}"
when "divide", "/"
  puts "You chose division."
  puts "Result: #{divide(first_num, second_num)}" 
else
  puts "You may only add, subtract, multiply, divide. Try again."
end
