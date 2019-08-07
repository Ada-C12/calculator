# These methods are called in the case/when statement to perform the calculations.
def addition(num1, num2)
    return num1 + num2
end

def subtraction(num1, num2)
    return num1 - num2
end

def multiplication(num1, num2)
    return num1 * num2
end

def division(num1, num2)
    return num1 / num2
end

puts "Welcome to the Calculator program! Which operator would you like to use?"
puts "1. add(+)"
puts "2. subtract(-)"
puts "3. multiply(*)"
puts "4. divide(/)"


#Asks user to choose an operator and converts input to downcase.
print "Please choose one operator (name or symbol): "
operator = gets.chomp.downcase


#Checks that user inputted the correct string and reprompts user to enter a new input if incorrect.
until operator == "add" || operator == "+" || operator == "subtract" || operator == "-" || operator == "multiply" || operator == "*" || operator == "divide" || operator == "/"
    puts "Invalid operator. Please select from the list above: "
    operator = gets.chomp.downcase
end


#Prompts user to enter first/second number and checks that the inputted string is either fully an integer or a float (no 9banana) using regex. Converts variable to a float.
puts "What is your first number?: "
first_number = gets.chomp
until first_number =~ /\A\d+\z/ || first_number =~ /\A\d+\.\d+\z/
    puts "Invalid input! PLease enter a number:"
    first_number = gets.chomp
end
first_number = first_number.to_f

puts "What is your second number?: "
second_number = gets.chomp
until second_number =~ /\A\d+\z/ || second_number =~ /\A\d+\.\d+\z/
    puts "Invalid input! PLease enter a number:"
    second_number = gets.chomp
end
second_number = second_number.to_f


#Calls the appropriate method for the corresponding selected operator. For division, the program checks whether the second number is zero and includes a separate output for those cases.
case operator
when "add", "+"
    answer = addition(first_number, second_number)
when "subtract", "-"
    answer = subtraction(first_number, second_number)
when "multiply", "*"
    answer = multiplication(first_number, second_number)
when "divide", "/"
    if second_number == 0
        answer = "Infinity"
    else
        answer = division(first_number, second_number)
    end
end


puts "Here is your answer!"
puts "#{answer}"
