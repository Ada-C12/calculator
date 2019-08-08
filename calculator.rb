# prints welcome message
puts "Welcome to the Calculator! Which operator would you like to use?"
puts "1. add(+)"
puts "2. subtract(-)"
puts "3. multiply(*)"
puts "4. divide(/)"
puts "5. compute exponent(^)"
puts "6. compute modulo(%)"
print "Please enter an operator (name or symbol): "

# asks the user to enter an operator, prints error if invalid input
oper = gets.chomp.downcase
until ["+","add","-","subtract","*", "multiply","/","divide","^","compute exponent", "%", "compute modulo"].include?(oper) == true
  print "You entered an invalid operator. Please enter a new operator: "
  oper = gets.chomp
end

# asks the user to enter two numbers, prints error if invalid input
print "Please enter your first number: "
num1 = gets.chomp
num1_test = num1.to_i
while num1_test.to_s != num1
  print "You entered an invalid number, please enter your first number again: "
  num1 = gets.chomp
  num1_test = num1.to_i
end
num1 = num1.to_i

print "Please enter your second number: "
num2 = gets.chomp
num2_test = num2.to_i
while num2_test.to_s != num2
  print "You entered an invalid number, please enter your second number again: "
  num2 = gets.chomp
  num2_test = num2.to_i
end
num2 = num2.to_i

# prints results using appropriate method, prints error if trying to divide by 0
print "\n"
print "Result: "
case oper 
when "add", "+"
  puts "#{num1} + #{num2} = #{num1 + num2}"
when "subtract", "-"
  puts "#{num1} - #{num2} = #{num1 - num2}"
when "multiply", "*"
  puts "#{num1} * #{num2} = #{num1 * num2}"
when "divide", "/"
  if num2 == 0
    puts "You attempted to divide by 0, we are unable to complete this calculation."
  else
    puts "#{num1} / #{num2} = #{num1 / num2}"
  end
when "compute exponent", "^"
  puts "#{num1} ^ #{num2} = #{num1 ** num2}"
when "compute modulo", "%"
  if num2 == 0
    puts "You attempted to divide by 0, we are unable to complete this calculation."
  else
    puts "#{num1} % #{num2} = #{num1 % num2}"
  end
end
print "\n"
