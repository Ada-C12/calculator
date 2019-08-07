puts "Hello user! Which operator would you like to use?
1. add or +
2. subtract or - 
3. multiply or *
4. divide or /
5. exponents or **
6. modulo or %
Please choose an operator (name or symbol)"
operator = gets.chomp.downcase.to_s

until operator == "add" || operator == "+" || operator == "subtract" || operator == "-" || operator == "multiply" || operator == "*" || operator == "divide" || operator == "/" || operator == "exponents" || operator == "**" || operator == "modulo" || operator == "%"
  puts "That's not a valid operator! Try again."
  operator = gets.chomp.downcase.to_s
end

puts "Enter the first number: "
num_one = gets.chomp.to_s
# case num_one
# when /\D/, ""
#   puts "Invalid input. Please put an integer or a float:"
#   num_one = gets.chomp
# end

puts "Enter the second number: "
num_two = gets.chomp.to_s
case num_two
when /\D/, ""
  puts "Invalid input. Please put an integer or a float:"
  num_two = gets.chomp
end

num_one = num_one.to_i
num_two = num_two.to_i

if operator == "divide" || operator == "/" && num_one == 0 || num_two == 0
  puts "Invalid. You can't divide by 0!"
    until num_two != 0
    puts "Put another second number:"
    num_two = gets.chomp.to_i
    end
end

def addition(num_one, num_two)
  answer = num_one + num_two
  puts "Great! #{num_one} + #{num_two} = #{answer}"
end 
def subtraction(num_one, num_two)
  answer = num_one - num_two
  puts "Great! #{num_one} - #{num_two} = #{answer}"
end 
def multiplication(num_one, num_two)
  answer = num_one * num_two
  puts "Great! #{num_one} * #{num_two} = #{answer}"
end 
def division(num_one, num_two)
    answer = num_one / num_two
  puts "Great! #{num_one} / #{num_two} = #{answer}"
end 
def exponent(num_one, num_two)
  answer = num_one ** num_two
  puts "Great! #{num_one} ** #{num_two} = #{answer}"
end
def modulos(num_one, num_two)
  answer = num_one % num_two
  puts "Great! #{num_one} % #{num_two} = #{answer}"
end

case operator
  when "add", "+"
  addition(num_one, num_two)
  when "subtract", "-"
  subtraction(num_one, num_two)
  when "multiply", "*"
  multiplication(num_one, num_two)
  when "divide", "/"
  division(num_one, num_two)
  when "exponents", "**"
  exponent(num_one, num_two)
  when "modulo", "%"
  modulos(num_one, num_two)  
end 
