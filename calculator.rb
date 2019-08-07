def calculator
    calculator_methods_display # define a function of calculator methods display, could be used again for invalid inputs
    calculator_name = ['add', 'substract', 'multiply', 'divide', 'exponent', 'modulo']
    calculator_symbol = ['+', '-', '*', '/', '^', '%']
    operator = gets.chomp.downcase

    while !calculator_name.include?(operator) && !calculator_symbol.include?(operator)
        puts "Invalid input"
        calculator_methods_display
        operator = gets.chomp.downcase
    end

    puts "What is your first number?"
    first_number = gets.chomp
    while first_number.to_i.to_s != first_number && first_number.to_f.to_s != first_number  # verify if the input is valid, both integer and float should be valid
        puts "Invalid input. What is your first number?"
        first_number = gets.chomp
    end

    input =~ /\d/
    puts "What is your second number?"
    second_number = gets.chomp
    if operator == 'exponent' || operator == '^'  # verify if the input is valid, if the operator is exponential, float is invalid and integer is valid
        while second_number.to_i.to_s != second_number
            puts "Invalid input. What is your second number?"
            second_number = gets.chomp
        end
    else
        while second_number.to_i.to_s != second_number && second_number.to_f.to_s != second_number
            puts "Invalid input. What is your second number?"
            second_number = gets.chomp
        end
    end

    puts "What do you need to return, an integer or a float?"
    result_class = gets.chomp.downcase
    while result_class != 'integer' && result_class != 'float' 
        puts "Invalid input. What do you need to return, an integer or a float?"
        result_class = gets.chomp.downcase
    end 
    
    if result_class == 'integer'
        first_number = first_number.to_i
        second_number = second_number.to_i
    else
        first_number = first_number.to_f
        second_number = second_number.to_f
    end
    
    perform_calculation_two_numbers(operator, first_number, second_number)
end

def calculator_methods_display
    puts "Welcome to the Calculator program! Which operator would you like to use?"
    puts "1. add(+)"
    puts "2. substract(-)"
    puts "3. multiply(*)"
    puts "4. divide(/)"
    puts "5. exponent(^)"
    puts "6. modulo(%)"
    puts "Please choose one operator(name or symbol):"
end

def perform_calculation_two_numbers(operator, num1, num2)
    case operator
    when 'add', '+'
        result = num1 + num2
        puts "Your calculation is #{num1} + #{num2} = #{result}"
    when 'substract', '-'
        result = num1 - num2
        puts "Your calculation is #{num1} - #{num2} = #{result}"
    when 'multiply', '*'
        result = num1 * num2
        puts "Your calculation is #{num1} * #{num2} = #{result}"
    when 'divide', '/'
        if num2 == 0
            result = 'infinity'
        else
            result = num1 / num2
        end
        puts "Your calculation is #{num1} / #{num2} = #{result}"
    when 'exponent', '^'
        result = num1 ** num2
        if num2 > 0
            exponent_arr = [] # create an array to store num2 num1s
            num2.to_i.times do
                exponent_arr << num1
            end
            exponent_display = exponent_arr.join(' * ') # display num1 * num1 * ... * num1
            puts "Your calculation is #{num1}^#{num2} = " + "#{exponent_display}" + " = #{result}"
        elsif num2 < 0
            exponent_arr = [] # create an array to store num2 num1s
            (-num2).to_i.times do
                exponent_arr << num1
            end
            exponent_display = exponent_arr.join(' * ') # display num1 * num1 * ... * num1
            puts "Your calculation is #{num1}^(#{num2}) = 1 /" + "(#{exponent_display})" + " = #{result}"
        else
            puts "Your calculation is #{num1}^#{num2} = #{result}"
        end
        
    when 'modulo', '%'
        result = num1 % num2
        puts "Your calculation is #{num1} % #{num2} = #{result}"
    end
end

calculator
