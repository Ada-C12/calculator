# Ada - Week 01

# Calculator Exercise
# Allows user to perform simple arithmetic from the command line

# Operator menu
def print_menu
  puts "\nMAIN MENU"
  puts "add (+)"
  puts "subtract (-)"
  puts "multiply (*)"
  puts "divide (/)"
  puts "modulo (%)"
  puts "exponify (^)"
end

# Get user input and validate it
def get_num
  user_num = gets.chomp

  while user_num.to_f == 0 && (user_num != "0" && user_num != "0.0")
    print "Sorry. Please enter a valid number: "
    user_num = gets.chomp
  end

  if user_num.include?(".")
    return user_num.to_f
  else
    return user_num.to_i
  end
end

# Addition
def add(first_num, second_num)
  sum = first_num + second_num
  return "#{first_num} + #{second_num} = #{sum}"
end

# Subtraction
def subtract(first_num, second_num)
  difference = first_num - second_num
  return "#{first_num} - #{second_num} = #{difference}"
end

# Multiplication
def multiply(first_num, second_num)
  product = first_num * second_num
  return "#{first_num} * #{second_num} = #{product}"
end

# Division
def divide(first_num, second_num)
  if second_num == 0
    return "You cannot divide by 0"
  else
    # Converting integers to floats to get a more precise answer
    quotient = first_num.to_f / second_num.to_f
    return "#{first_num} / #{second_num} = #{quotient}"
  end
end

# Modulo
def modulo(first_num, second_num)
  modulus = first_num % second_num
  return "#{first_num} % #{second_num} = #{modulus}"
end

# Exponentiation
def exponify(first_num, second_num)
  power = first_num**second_num

  equation = "#{first_num}^#{second_num} = "

  (second_num - 1).times do 
    equation << "#{first_num} * "
  end

  equation << "#{first_num} = #{power}"
  
  return equation
end

# Welcome user to the program
puts "Welcome to Dianna's Calculator program!"

# Set a flag for playing again
play = true

while play
  # Show user the menu
  print_menu

  # Get operator and numbers from the user
  print "\nPlease choose one operator (name or symbol): "
  operator = gets.chomp.downcase

  operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "modulo", "%", "exponify", "^"]

  # Make sure user enters a valid operator
  until operations.include?(operator)
    print "Sorry. Please choose one valid operator (name or symbol): "
    operator = gets.chomp.downcase
  end

  # Get first number from the user
  print "Great! What is the first number you want to use? "
  first_num = get_num

  # Get second number from the user
  print "What is the second number you want to use? "
  second_num = get_num

  # Use operator to apply the appropriate mathematical operation
  case operator
    when "add", "+"
      result = add(first_num, second_num)
    when "subtract", "-"
      result = subtract(first_num, second_num)
    when "multiply", "*"
      result = multiply(first_num, second_num)
    when "divide", "/"
      result = divide(first_num, second_num)
    when "modulo", "%"
      result = modulo(first_num, second_num)
    when "exponify", "^"
      result = exponify(first_num, second_num)
  end

  puts "The answer is: #{result}."

  # Ask the user if they want to play again
  print "Do you want to use the calculator again? Y or N "
  answer = gets.chomp.upcase

  until answer == "Y" || answer == "N"
    print "Please enter Y or N: "
    answer = gets.chomp.upcase
  end

  if answer == "N"
    play = false
  end
end

puts "\nThank you for using this program. Goodbye!"
