puts "Welcome to the Calculator program! Which operator would you like to use?

1. add(+)
2. subtract(-)
3. multiply(*)
4. divide(/)"

puts "\nPlease choose one operator (term or symbol):"

operator_symbols = ["-", "*", "/", "+"]
operator_terms = ["subtract", "multiply", "divide", "add"]

user_operator_input = gets.chomp.downcase

# Asks user to provide a valid response until input matches 
# elements contained in the operator_symbols or operator_terms 
# arrays. 
until operator_symbols.include?(user_operator_input) || operator_terms.include?(user_operator_input)
  puts "Please provide a valid response:"
  user_operator_input = gets.chomp.downcase
end 

# The value "i" is assigned to first_number and 
# second_number to initiate the while loop below.  
first_number = "i"
second_number = "i"

# Must provide two valid integers as input.
while (first_number =~ /[\D]/ || first_number.empty?) || (second_number =~ /[\D]/ || second_number.empty?)
  puts "Please provide two valid numbers:"
  first_number = gets.chomp
  second_number = gets.chomp
end 

first_number = first_number.to_i
second_number = second_number.to_i

# The value of 0 is increased by 1 to prevent an error message if
# first_number is divided by second_number.
if second_number == 0 && (user_operator_input == "divide" ||   user_operator_input == "/")
 second_number += 1
end 

# Methods created to produce sums of second_number and 
# first_number depending on the operator.
def addition_sum(a, b)
  a + b
end 

def subtraction_sum(a, b)
  a - b
end

def multiplication_sum(a, b)
  a * b
end 

def division_sum(a, b)
  a/b
end 

# Prints sum depending on which operator term or symbol was 
# assigned to user_operator_input.
case user_operator_input
when "add", "+"
  puts "#{first_number} + #{second_number} = #{addition_sum(first_number, second_number)}"
when "subtract", "-"
  puts "#{first_number} - #{second_number} = #{subtraction_sum(first_number, second_number)}"
when "multiply", "*"
  puts "#{first_number} * #{second_number} = #{multiplication_sum(first_number, second_number)}"
when "divide", "/"
  puts "#{first_number} / #{second_number} = #{division_sum(first_number, second_number)}"
end
