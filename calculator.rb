# given a chosen user operator, operator_validate looks through a hash of operations to check if the user provided input is a valid selection
# it then standardizes operator input accross variety of posisble user inputs by checking values in operators hash
# if it's not a valid input, the user in prompted to renter
# operator_validate is called until user input is valid
def operator_validate(operations,chosen_operator)
    if operations[:addition].include?(chosen_operator)
        chosen_operator = "+"
    elsif operations[:subtraction].include?(chosen_operator)
        chosen_operator = "-"
    elsif operations[:multiplication].include?(chosen_operator)
        chosen_operator = "*"
    elsif operations[:division].include?(chosen_operator)
        chosen_operator = "/"
    elsif operations[:exponent].include?(chosen_operator)
        chosen_operator = "^"
    elsif operations[:modulo].include?(chosen_operator)
        chosen_operator = "%"
    else 
        print " Error, invalid entry. Please re-enter selection: "
        reinput = gets.chomp.downcase
        operator_validate(operations,reinput)
    end
end

# validates that numbers inputed contain numbers
def num_validate(user_input)
    until user_input.match(/[0-9]/)
      print " Error, invalid entry. Please re-enter selection: "
      user_input = gets.chomp
    end
    return user_input
end

# calculates results of two numbers entered based on user inputed operator
# handles divide when attempting to divide by zero
# ask user if they want result to be a float or integer and return result based on answer
def calculate(operator_sym, nums)
    case operator_sym
    when "+"
        answer = nums[0] + nums[1]
    when "-"
        answer = nums[0] - nums[1]
    when "*"
        answer = nums[0] * nums[1]
    when "/"
        if nums[1] == 0
            return "Can't divide by zero"
        else
            answer = nums[0] / nums[1]
        end
    when "^"
        answer = nums[0] ** nums[1]
    when "%"
        answer = nums[0] % nums[1]
    end
    
    print "Do you want to display result as float or integer? "
      input = gets.chomp   
    until ["float","integer","f","i","int","fl"].include?(input)
      print " Error, invalid entry. Please re-enter selection: "
        input = gets.chomp
    end
    result_display = input

    case result_display
    when "float", "f", "1","fl"
        return answer.to_f
    when "integer", "i", "2","int"
        return answer.to_i
    end
end

# support for 6 operations: addition, subtraction, multiplication, division, expontents, and modulos
# program supports user input for name, close variants, symbol, and list number
# the way code is currently written, first & second elements in key arrays are what are used to show user selection options, don't change these/add new variants on end
operators = {
    addition: ["add", "+", "1", "addition"],
    subtraction: ["subtract","-", "2", "sub", "subtration"],
    multiplication: ["multiple", "*", "3", "mult", "multiply","x"],
    division: ["divide", "/", "4", "div", "division"],
    exponent: ["exponent","^","5", "exp", "exponential"],
    modulo: ["modulo","%","6", "mod"],
}

# Ask the user for a math operation
puts "\nWelcome to my Calculator program! Which operator would you like to use?"

#Prints out possible operator selections from operators hash for user to select from
listcount = 0
operators.each_value do |possible_choices|
    listcount += 1
    puts "#{listcount}. #{possible_choices[0].capitalize} (#{possible_choices[1]})"
end

# accept user input for operator
# accept a variety of close variant inputs by running operator_validate on the operators hash and users input
# use .downcase method to accept input no matter entered case
print "\nPlease choose one operator (name or symbol): "
  input = gets.chomp.downcase
  operator = operator_validate(operators,input)

# Ask the user for two numbers to use for the math operation
numbers = Array.new
2.times do |numcount|
  print "Please enter number #{numcount + 1}: "
    input = gets.chomp
  number = num_validate(input)
  numbers << number.to_f
end

# display results - display as 2*2*2 if 2^3
if operator == "^"
    expon = Array.new(numbers[1],numbers[0])
    display = expon.join(' * ')
else    
  display = "#{numbers[0]} #{operator} #{numbers[1]}"
end

# provide result of applying the user chose operation to the two user chosen numbers
puts "\nHere are your results: #{display} = #{calculate(operator,numbers)}\n "

