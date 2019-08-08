def print_operator_list(list)
    count = 1
    list.each do |key, value|
        puts "#{count}. #{key}(#{value})"
        count += 1
    end
end

def get_result_type_from_user()
    result_type = ["integer", "float"]
    puts "Do you want your result to be integer or float? "
    answer = gets.chomp.downcase
    while !result_type.include?(answer)
        print "Hey, that's not a valid option. Valid options are Integer or Float! "
        answer = gets.chomp.downcase
    end
    return answer
end

def get_operator_input_from_user(operator_list)
    operator = gets.chomp.downcase
    until operator_list.keys.include?(operator.to_sym) || operator_list.values.include?(operator)
        puts "Bummer, that's not a valid math operator. Please enter in a valid operator"
        print_operator_list(operator_list)
        operator = gets.chomp.downcase
    end
    
    if operator == "add"
        operator = '+'
    elsif operator == "subtract"
        operator = '-'
    elsif operator == "multiply"
        operator = '*'
    elsif operator == "divide"
        operator = '/'
    elsif operator == "power"
        operator = '^'
    elsif operator == "mod"
        operator = '%'
    end
    
    return operator
end

def get_a_number_from_user()  
    while true
        input = gets.chomp
        number =  Float(input) rescue false
        if number
            return number
        else
            print "Invalid input. Input must be a number: "
        end
    end   
end

def calculator(operand1, operand2, operator)
    case operator       
    when '+'
        return (operand1 + operand2)
    when '-'
        return (operand1 - operand2)
    when '*'
        return (operand1 * operand2)
    when '/'
        return (operand1 / operand2)
    when '^'
        puts "Exponent can't be Float, your exponent was rounded down for this operation"
        return (operand1 ** operand2.to_i)
    else
        return (operand1 % operand2)
    end  
end

def main()
    operator_list = { 
        "add": '+',
        "subtract": '-',
        "multiply": '*',
        "divide": '/',
        "power": '^',
        "mod": '%'
    }
    
    puts "Welcome to the Calculator program! Which operator would you like to use?"
    print_operator_list(operator_list)  
    
    operator = get_operator_input_from_user(operator_list)
    
    print "Please enter first number: "
    first_number = get_a_number_from_user()
    
    print "Please enter second number: "
    second_number = get_a_number_from_user()
    while (operator == '/' || operator == '%') && (second_number == 0)
        print "Ahhh, 0 can't be a divisor. Too bad, please reenter another number: "
        second_number = get_a_number_from_user()
    end
    
    result_type = get_result_type_from_user()
    if result_type == "integer"
        result = calculator(first_number.to_i, second_number.to_i, operator)
    else
        result = calculator(first_number, second_number, operator)
    end
    
    puts "#{first_number} #{operator} #{second_number} = #{result}"
end

main()
