# Method to get and validate operands
def get_operand
  operand = gets.chomp
  while operand.empty? || (!operand.match("^[\-0-9]*$"))
    puts "Invalid input. Please enter a number"
    operand = gets.chomp
  end
  return operand.to_f
end

# Get user input for operator, set casing and convert to string.
puts "Which one of the following operators would you like to use:

Add (+) 
Subtract(-) 
Multiply(*)
Divide(/)
Remainder(%)
Exponify(**)

Please select an operator"
operator = gets.chomp.to_s.downcase

# Instantiate list of accepted operator inputs and check that input was accepted. Input validation
accepted = %w[+ add - subtract * multiply / divide remainder % exponify **]

until accepted.include?(operator)
  puts "Invalid input. Please enter an operator"
  operator = gets.chomp.to_s.downcase
end

# Case to convert valid operator user input into symbol
operator_select = nil
case operator
when "add", "+"
  operator_select = :+
when "subtract", "-"
  operator_select = :-
when "multiply", "*"
  operator_select = :*
when "divide", "/"
  operator_select = :/
when "remainder", "%"
  operator_select = :%
when "exponify", "**", "^"
  operator_select = :**
end

operand = ()

# Get user input for operands
puts "What is your first number?"
operand1 = get_operand()
puts "What is your second number?"
operand2 = get_operand()

# Validate that the user is not trying to divide by 0
while operator_select == :/ && operand2 == 0
  puts "You cannot divide by zero"
  puts "What is your second number?"
  operand2 = get_operand()
end

# Output equation and solution
puts "Let's do this math!"
puts "#{operand1} #{operator_select} #{operand2} = #{operand1.to_f.public_send(operator_select, operand2.to_f)}"
