puts "Which operation would you like to run?"
puts """
Add (+)
Subtract (-)
Multiply (*)
Divide (/)
Exponent (**)
Modulus (%)

"""
print "> "
# save user input to operation variable
operation = gets.chomp.downcase

# create method with parameters for word and symbol of operator
def calculate(operate, symbol)
  # ask user for first number
  puts "What is the first number you would like to #{operate}?"
  number1 = gets.chomp
  # loop until the user answer includes an integer and does not include a letter
  until number1 =~ /[0-9]/ && !(number1 =~ /[a-z]/) && !(number1 =~ /[A-Z]/)
    puts "Not valid! Enter a number:"
    number1 = gets.chomp
  end
  number1 = number1.to_f
  
  # ask user for second number
  puts "What is the second number you would like to #{operate}?"
  number2 = gets.chomp
  # loop until the user answer includes an integer and does not include a letter
  until number2 =~ /[0-9]/ && !(number2 =~ /[a-z]/) && !(number2 =~ /[A-Z]/)
    puts "Not valid! Enter a number:"
    number2 = gets.chomp
  end
  number2 = number2.to_f
  
  # handles divide when attempting to divide by zero
  # exits program if second number is 0
  if operate == "divide" && number2 == 0
    puts "Can't divide by 0, nice try!"
    exit(0)
  end
  
  # Print out the formula in addition to the result
  puts "Let's #{operate} #{number1} #{symbol} #{number2}"
  # use send method to pass operator that is a string class as legitimate math operator
  total = number1.send(symbol, number2)
  puts "Your total is #{'%.2f' % total}" # format total to print with two decimals places
  # return calculated value
  return total
end

# pass method with applicable arguments per user entry
case operation
when  "add", "+"
  calculate("add", "+")
when "subtract", "-"
  calculate("subtract", "-")
when "multiply", "*"
  calculate("multiply", "*")
when "divide", "/"
  calculate("divide", "/")
when "exponent", "**"
  calculate("exponent", "**")
when "modulus", "%"
  calculate("modulus", "%")
else
  # handle erroneous user input
  puts "That is not a valid entry."
end
