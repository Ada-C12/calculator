# prompts until argument is a number
def is_a_num(num)
  until num.to_i.to_s == num || num.to_f.to_s == num
    puts "Oops. Please enter a number:"
    num = gets.chomp
  end
  if num % 1 == 0
    return num.to_i
  else
    return num.to_f
  end
end

# prompts the user for 2 values
def get_numbers()
  num = []
  ["first", "second"].each do |order|
    puts "Enter the #{order} number:"
    num << is_a_num(gets.chomp)
  end
  return num
end

# prints the calculation results
def print_result(numbers, operator)
  if operator == "/" && numbers[1] == 0
    puts "#{numbers[0]} #{operator} #{numbers[1]} = Infinity"
  else
    puts "#{numbers[0]} #{operator} #{numbers[1]} = #{numbers[2]}"
  end
end

# returns the addition of 2 numbers
def add()
  numbers = get_numbers
  numbers << numbers[0] + numbers[1]
  return numbers
end

# returns the subtration of 1 number from another
def subtract()
  numbers = get_numbers
  numbers << numbers[0] - numbers[1]
  return numbers
end

# returns the multiplication of 2 numbers
def multiply()
  numbers = get_numbers
  numbers << numbers[0] * numbers[1]
  return numbers
end

# returns the division of 2 numbers
def divide()
  numbers = get_numbers
  if numbers[1] != 0
    numbers << numbers[0] / numbers[1]
  end
  return numbers
end

# returns the value computed for a base number to a given exponent
def exponent()
  numbers = get_numbers
  numbers << numbers[0] ** numbers[1]
  return numbers
end

# returns the modulus of 2 numbers
def modulo()
  numbers = get_numbers
  numbers << numbers[0] % numbers[1]
  return numbers
end


puts "Welcome to the Calculator program!"

valid_prompt = false
until valid_prompt
  puts "Which operator would you like to use?
    1. add(+)
    2. subtract(-)
    3. multiply(*)
    4. divide(/)
    5. exponent(^)
    6. modulo(%)
  \rPlease choose one operator(name or symbol):"

  operator = gets.chomp.downcase

  # calls the function for printing results depending on operator
  # the arguments of print_result are evaluated so that an array and a string are passed
  case operator
    when "add", "+"
      valid_prompt = true
      print_result(add, "+")
    when "subtract", "-"
      valid_prompt = true
      print_result(subtract, "-")
    when "multiply", "*"
      valid_prompt = true
      print_result(multiply, "*")
    when "divide", "/"
      valid_prompt = true
      print_result(divide, "/")
    when "exponent", "^"
      valid_prompt = true
      print_result(exponent, "^")
    when "modulo", "%"
      valid_prompt = true
      print_result(modulo, "%")
    else
      puts "Oops! Not a valid operator."
  end
end
