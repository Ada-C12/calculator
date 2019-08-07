# performs calculations based on user input
def calculations(operator, num1, num2)
  if operator == "add" || operator == "+"
    result = (num1.to_f) + num2.to_f
    return result
  elsif operator == "subtract" || operator == "-"
    result = (num1.to_f) - num2.to_f
    return result
  elsif operator == "multiply" || operator == "*"
    result = (num1.to_f) * num2.to_f
    return result
  elsif operator == "divide" || operator == "/"
    result = (num1.to_f) / num2.to_f
    if num2.to_i == 0
      puts "You cannot divide by zero"
      exit
    end
    return result
  elsif operator == "exponent" || operator == "*"
    result = (num1.to_f) / num2.to_f
    return result
  else
    puts "Error!"
  end
end

# validates user input as numbers and no empty space
def valid_num(num)
  while num =~ /[a-zA-Z]/ || num.empty?
    puts "Invalid selection."
    print "Please enter a valid number: > "
    num = gets.chomp
  end
  return num
end

# validates user's operator request
def valid_operator(operators, operator)
  while !(operators.include?(operator))
    puts "Invalid selection."
    print "Please enter a valid operator: > "
    operator = gets.chomp
  end
  return operator
end

# list of available operators
operators = ["add","+","subtract","-","multiply","*","divide","/", "exponent", "*"]

# greeting message
puts "Wecome to the Calculator program! Which operator would you like to use?"

# prints out operator options for user
i = 0
(operators.length / 2).times do
  puts "#{i + 1}. #{operators[i * 2]}(#{operators[(i * 2) + 1]})"
  i += 1
end

# gets input & validates it.
print "Please choose one operator (name or symbol): >"
operator = gets.chomp
valid_operator(operators, operator)

# gets input & validates it.
print "What is your first number? >"
num1 = gets.chomp
valid_num(num1)

# gets input & validates it.
print "What is your second number? >"
num2 = gets.chomp
valid_num(num2)

# performs calculation
puts calculations(operator, num1, num2)
