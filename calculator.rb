## Project: Calculator Exercise (2019.08.06)

# terminal-run calculator that does simple arithmetic.

# ask user for:
#   1. a math operation
#   2. a number for the operation
#   3. a second number for the operation

# evaluate the arithmetic of the input.
# output evaluation to user.

# should support:
#   1. addition ("add" or "+")
#   2. subtraction ("subtract" or "-")
#   3. multiplication ("multiply" or "*")
#   4. division ("divide" or "/")
# (you may add other names/symbols for these)

# make sure program handles:
#   all supported arithmetic
#   dividing by zero
#   erroneous input (exit the program when invalid input is entered)

# optional enhancements:
#   keep asking for valid input until it is received. [done]
#   print out the formula in addition to the result. [done]
#   add support for computing exponents. [done]
#   add support for the modulo operator. [done]
#   make your program know when it needs to return an integer vs a float. [done]
#   add support for parentheticals. []
#   add support for handing uppercase. [done]


## Variables

welcome_to_program = "Welcome to the calculator program!\n"
welcome_to_program << "You will be asked to input a math operator and two numbers to be operated upon.\n"

# possible arithmetic commands/operators.
commands = {
  :add => ["add", "+"],
  :subtract => ["subtract", "-"],
  :multiply => ["multiply", "*"],
  :divide => ["divide", "/"],
  :modulo => ["modulo", "%"],
  :exponent => ["exponent", "**"]
}

# holds the desired arithmetic ingredients to be gathered from the user.
desired_inputs = {
  :operator => "mathematical operator",
  :first_num => "number",
  :second_num => "second number"
}

# calculation ingredients gathered from user.
user_ingredients = {}


## Methods

# gather all the calculation ingredients from the user.
def ask_for_ingredients(ingredients, user_ingredients, commands)
  
  # for each of the ingredients, ask the user for input.
  ingredients.each_pair do |type_name, input_type|
    
    while user_ingredients[type_name] == nil
      user_input = ask_for_input(input_type)
      
      if type_name == :second_num && commands[:divide].include?(user_ingredients[:operator]) && is_zero(user_input)
        puts "You cannot divide by zero."
      elsif (type_name == :operator && !is_command(user_input, commands)) ||
        (type_name == :first_num && !is_numeric(user_input)) ||
        (type_name == :second_num && !is_numeric(user_input)) 
        puts "You did not enter an #{input_type}"
      else
        user_ingredients[type_name] = user_input
      end
    end
    
  end
  
end

# asks the user to input a single piece of data.
def ask_for_input(input_type)
  puts prompt = "Please enter a #{input_type}:  "
  user_input = gets.chomp.downcase
  return user_input
end

# checks if the user's input is a number.
def is_numeric(str)
  return !!(str =~ /\A[-]*\d+\Z/ || str =~ /\A[-]*\d+\.\d+\Z/)
end

# checks if the user's input is a zero.
def is_zero(str)
  return !!(str =~ /\A[-]*[0]\Z/)
end

# checks if the user's input is a valid command.
def is_command(str, commands)
  succeeded = false
  commands.each_pair do |name, options|
    if options.include?(str)
      succeeded = true
    end
  end
  return succeeded
end

# changes user input from a written command to the appropriate symbol
def adjust_input(ingredients, commands)
  # changes written commands to their appropriate symbol (ex: "add" to "+")
  commands.each_pair do |command_name, options|
    if ingredients[:operator] == options[0]
      ingredients[:operator] = options[1]
    end
  end
  
  # constructs a list of components from the ingredients.
  components = []
  components[0] = ingredients[:operator]
  components[1] = ingredients[:first_num].to_f
  components[2] = ingredients[:second_num].to_f
  
  # returns the list of correctly-formatted components
  return components
end

# builds and evaluates the operation (that is based on user input).
def evaluate_input(components)
  answer = eval "#{components[1]} #{components[0]} #{components[2]}"
  answer = answer.round(4)
  components[3] = answer
  return components
end

# shows results of the evaluation to user.
def display_evaluation(components)  
  count = 0
  while count < components.length
    if !!(components[count].to_s =~ /\.[0]+\Z/)
      components[count] = components[count].to_i.to_s
    end
    count += 1
  end
  
  operation = "#{components[1]} #{components[0]} #{components[2]} = #{components[3]}"
  puts "You're answer is:"
  puts "  #{operation}"
end


## Main Code

# displays the program welcome message.
puts welcome_to_program

# ask the user to enter the ingredients of an arithmetic calculation.
ask_for_ingredients(desired_inputs, user_ingredients, commands)

# construct and evaluate the calculation (which is based the user ingredients).
user_calculation_pieces = evaluate_input(adjust_input(user_ingredients, commands))

# display the evaluation to the user.
display_evaluation(user_calculation_pieces)
