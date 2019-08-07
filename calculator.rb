# This program will calculate things
puts "Welcome to the Calculator program! 
Which operator would you like to use?
1. add(+)
2. subtract(-)
3. multiply(*)
4. divide(/)
Please choose one operator (name or symbol):"
user_input = gets.chomp.downcase

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
    if num2 == 0
        return "Infinity!"
    else
        return num1 / num2
    end
end

def integer_check(num)
    begin
        num = Integer(num)
    rescue ArgumentError
        print "Not a valid number. Please enter a valid number: "
        num = gets.chomp
        retry
    end
    return num
end

# Realizing I should've used more comments and actually utilized case/when syntax =(
while
    if user_input == "add" || user_input == "+"
        puts "WE ARE ADDING!"
        puts "Enter your first number:"        
        value1 = integer_check(gets.chomp)
        
        puts "Enter your second number:"
        value2 = integer_check(gets.chomp)
        
        answer = addition(value1, value2)
        puts "#{value1} + #{value2} = #{answer}"
        
    elsif user_input == "subtract" || user_input == "-"
        puts "WE ARE SUBTRACTING!"
        puts "Enter your first number:"        
        value1 = integer_check(gets.chomp) 
        
        puts "Enter your second number:"
        value2 = integer_check(gets.chomp)
        
        answer = subtraction(value1,value2)
        puts "#{value1} - #{value2} = #{answer}"
        
    elsif user_input == "multiply" || user_input == "*"
        puts "WE ARE MULTIPLYING!"
        puts "Enter your first number:"
        value1 = integer_check(gets.chomp) 
        
        puts "Enter your second number:"
        value2 = integer_check(gets.chomp)
        
        answer = multiplication(value1,value2)
        puts "#{value1} * #{value2} = #{answer}"
        
    elsif user_input == "divide" || user_input == "/"
        puts "WE ARE DIVIDING!"
        puts "Enter your first number:"
        value1 = integer_check(gets.chomp) 
        
        puts "Enter your second number:"
        value2 = integer_check(gets.chomp)
        
        answer = division(value1,value2)
        puts "#{value1} / #{value2} = #{answer}"
        
    else
        puts "Not a valid input. \nPlease choose one operator (name or symbol): "
        user_input = gets.chomp.downcase
    end
end
