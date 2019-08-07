# build a calculator command line interface (CLI) to perform simple arthmetic
# program should accept both the name and the symbol
#   add and +
#   subtract and -
#   multiply and *
#   divide and /
# ask user for math operation

puts "Welcome to the Calculator Program! Which operator would you like to use?
1. add(+)
2. subtract(-)
3. multiply(*)
4. divide(/)

Please choose one operator (name or symbol): "

# required to handle lowercases of the operations above
operator = gets.chomp.downcase

# handle invalid/nil input for math operation
until ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"].include?(operator)
  puts "Invalid input. Please type the name or symbol you would like to use: "
  operator = gets.chomp.downcase
end

# verify numeric inputs as integer
# if input is invalid/nil, display error message and ask for input again
class String
  def is_integer?
    self.to_i.to_s == self
  end
end

def integer_chk(num)
  until num.is_integer?
    print "Invalid. Not a number. Please enter a number: "
    num = gets.chomp
  end
  return num
end

# ask user for first number
print "Enter the first number for this equation: "
# first_num = gets.chomp.to_i
first_num = gets.chomp
first_num = integer_chk(first_num)
first_num = first_num.to_i

# ask user for second number
print "Enter the second number for this equation: "
second_num = gets.chomp
second_num = integer_chk(second_num)
second_num = second_num.to_i

# applying the operation to the two numbers
case operator
when "add", "+"
  puts first_num + second_num
when "subtract", "-"
  puts first_num - second_num
when "multiply", "*"
  puts first_num * second_num
when "divide", "/"
  # if dividing by 0, invalid response
  if second_num == 0
    puts "Undefined. Can't divide by 0."
  else
    puts first_num / second_num
  end
end
