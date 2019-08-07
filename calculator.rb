
puts "*** Welcome to Natalie's Calculator! ***
1. add(+)
2. subtract(-)
3. multiply(*)
4. divide(/)
-----------------
Please chose an operator (name or symbol):"
operator = gets.chomp

# an array with all possible operators
operators = ["+", "add", "-", "subtract", "*", "multiply", "times", "/", "divide"]

until operators.include?(operator)
  puts "That's not a valid operator. Select from the following list:
  1. add(+)
  2. subtract(-)
  3. multiply(*)
  4. divide(/)"
  operator = gets.chomp
end

# The program handles erroneous input. For example the user might enter clown when asked to enter a number
def is_string(a)
  return a.to_f == 0 && a != "0" 
end

# this is getting set to cloud or whatever string 
puts "Give me the first number to #{ operator }"
first_number = gets.chomp
while is_string(first_number)
  puts "that's a string, pls give me a number"
  first_number = gets.chomp
end

puts "Give me the second number to #{ operator }"
second_number = gets.chomp
while is_string(second_number)
  puts "that's a string, pls give me a number"
  second_number = gets.chomp
end

def add(a,b)
  sum = a.to_f + b.to_f
  return "#{ a } + #{ b } = #{ sum }"
end

def subtract(a,b)
  difference = a.to_f - b.to_f
  return "#{ a } - #{ b } = #{ difference }"
end

def multiply(a,b)
  product = a.to_f * b.to_f
  return "#{ a } * #{ b } = #{ product }"
end

def divide(a,b)
  if b == "0"
    return "ERROR CANNOT DIVIDE BY ZERO"
  else
    quotient = a.to_f / b.to_f
    return "#{ a } * #{ b } = #{ quotient }"
  end 
end

result = 0 
puts "--------------------"
if (first_number == nil || second_number == nil) 
  result = "NO OUTPUT"
elsif
  case operator
  when  "+","add"
    puts add(first_number,second_number)
  when "-","subtract"
    puts subtract(first_number,second_number)
  when "*","multiply","times"
    puts multiply(first_number,second_number)
  when "/","divide"
    puts divide(first_number,second_number) 
  end
end

