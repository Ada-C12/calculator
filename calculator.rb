puts %q(
Welcome to the Calculator program!"
Which operator would you like to use? 
add(+)
substract(-)
multiply(*)
divide(/)
power(^)
modulo(%)
Please choose one operator (name or symbol):)
operator = gets.chomp.to_s

# The program handles erroneous input

until operator == "add" || operator == "+" || operator == "substract" || operator == "-" || operator == "multiply" || operator == "*" || operator == "divide" || operator == "/" || operator == "power" || operator == "^" || operator == "modulo" || operator == "%" 
  puts "Please choose a valid operator (name or symbol): "
  operator = gets.chomp.to_s
end

puts "Enter the first number: "
num_one_string = gets.chomp
until num_one_string.to_i.to_s == num_one_string
  puts "Enter a valid first number: " 
  num_one_string = gets.chomp
end

puts "Enter the second number "
num_two_string = gets.chomp
until num_two_string.to_i.to_s == num_two_string
  puts "Enter a valid second number: " 
  num_two_string = gets.chomp
end

def add(num_one, num_two)
  return num_one + num_two
end

def substract(num_one, num_two)
  return num_one - num_two
end

def multiply(num_one, num_two)
  return num_one * num_two
end

def power(num_one, num_two)
  return num_one ** num_two
end

def modulo(num_one, num_two)
  return num_one % num_two
end

# The program handles divide when attempting to divide by zero
def divide(num_one, num_two)
  if num_two == 0
    until num_two != 0
      puts "You can't divide by zero. Enter the second number again: "
      num_two = gets.chomp.to_i
    end
  end
    return num_one / num_two
end

if operator == "add" || operator == "+" 
  result = add(num_one_string.to_i, num_two_string.to_i)
  puts "#{num_one_string}" " + " "#{num_two_string}" " = " "#{result}"
elsif operator == "substract" || operator == "-"
  result = substract(num_one_string.to_i, num_two_string.to_i)
  puts "#{num_one_string}" " - " "#{num_two_string}" " = " "#{result}"
elsif operator == "multiply" || operator == "*"
  result = multiply(num_one_string.to_i, num_two_string.to_i)
  puts "#{num_one_string}" " * " "#{num_two_string}" " = " "#{result}"
elsif operator == "divide" || operator == "/"
  result = divide(num_one_string.to_i, num_two_string.to_i)
  puts "#{num_one_string.to_i}" " / " "#{num_two_string.to_i}" " = " "#{result}"
elsif operator == "power" || operator == "^"
  result = power(num_one_string.to_i, num_two_string.to_i)
  puts "#{num_one_string}" " ^ " "#{num_two_string}" " = " "#{result}"
elsif operator == "modulo" || operator == "%"
  result = modulo(num_one_string.to_i, num_two_string.to_i)
  puts "#{num_one_string}" " % " "#{num_two_string}" " = " "#{result}"

end
