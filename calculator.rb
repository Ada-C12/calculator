def is_numeric?(input)
  input.to_i.to_s == input || input.to_f.to_s == input
end

def add(num_1, num_2)
  puts "#{num_1} + #{num_2} = #{num_1 + num_2}"
end 

def subtract(num_1, num_2)
  puts "#{num_1} - #{num_2} = #{num_1 - num_2}"
end 

def multiply(num_1, num_2)
  puts "#{num_1} * #{num_2} = #{num_1 * num_2}"
end 

def divide(num_1, num_2)
  while num_2 == 0
    puts "Whoa. We cannot divide by 0. Please input a different second number: "
    num_2 = gets.chomp
    while !is_numeric?(num_2)
      puts "Error: please enter only numerical values."
      num_2 = gets.chomp 
    end 
    if num_2.include?(".")
      num_2 = num_2.to_f
    else 
      num_2 = num_2.to_i
    end 
  end 
  puts "#{num_1} / #{num_2} = #{num_1 / num_2}"
end 

def modulo(num_1, num_2)
  puts "#{num_1} % #{num_2} = #{num_1 % num_2}"
end

def exponent(num_1, num_2)
  puts "#{num_1} ^ #{num_2} = #{num_1 ** num_2}"
end

puts "Calculation time!!!"
puts "Which operator would you like to use?
1. add(+)
2. subtract(-)
3. multiply(*)
4. divide(/)
5. modulo(%)
6. exponent(^)
Please choose one operator(name or symbol): "
user_operator = gets.chomp.downcase 

correct_input = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "modulo", "%", "exponent", "^"]
while !correct_input.include?(user_operator)
  puts "Oops: Please only type a word or symbol listed in the above options:"
  user_operator = gets.chomp.downcase  
end 

puts "What is your first number?"
num_1 = gets.chomp
while !is_numeric?(num_1)
  puts "Oops: please enter only numerical values."
  num_1 = gets.chomp 
end 

if num_1.include?(".")
  num_1 = num_1.to_f
else 
  num_1 = num_1.to_i
end 

puts "What is your second number?"
num_2 = gets.chomp
while !is_numeric?(num_2)
  puts "Oops: please enter only numerical values."
  num_2 = gets.chomp 
end 
if num_2.include?(".")
  num_2 = num_2.to_f
else 
  num_2 = num_2.to_i
end 

case user_operator
when "add", "+"
  add(num_1, num_2)
when "subtract", "-"
  subtract(num_1, num_2)
when "multiply", "*"
  multiply(num_1, num_2)
when "divide", "/"
  divide(num_1, num_2)
when "modulo", "%"
  modulo(num_1, num_2)
when "exponent", "^"
  exponent(num_1, num_2)
end  
