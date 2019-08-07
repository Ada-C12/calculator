#Setting Up Operators
operators = ["1", "add", "+", "2", "subtract", "-", "3", "multiply", "*", "4", "divide", "/", "5", "exponent", "^", "6", "modulo", "remainder", "%"]
numbers = []

#Validation Methods
def data_type (num_one)
    if num_one.include?(".") == true
        num_one = num_one.to_f
    else
        num_one = num_one.to_i
    end
    return num_one
end

def number?(obj)
    obj = obj.to_s unless obj.is_a? String
    /\A[+-]?\d+(\.[\d]+)?\z/.match obj
    #Lines 15-17 Source: https://medium.com/launch-school/number-validation-with-regex-ruby-393954e46797
end

#Setting Up Calculation Methods
def addition (num_one, num_two)
    print "#{num_one} + #{num_two} = "
    return num_one + num_two
end

def subtraction (num_one, num_two)
    print "#{num_one} - #{num_two} = "
    return num_one - num_two
end

def multiplication (num_one, num_two)
    print "#{num_one} * #{num_two} = "
    return (num_one * num_two)
end

def division (num_one, num_two)
    if num_one == 0 || num_two == 0
        puts "Invalid Result - Cannot Divide by 0"
    else
        return (num_one / num_two)
        print "#{num_one} / #{num_two} = "
    end
end

def exponent (num_one, num_two)
    print "#{num_one} ^ #{num_two} = "
    return num_one ** num_two
end

def remainder (num_one, num_two)
    print "#{num_one} % #{num_two} = "
    return (num_one % num_two).to_i
end

#User Main Menu
puts "Calculator Program\n\nWhich Operator would you like to Use?"
puts "1. Add(+)\n2. Subtract(-)\n3. Multiply(*)\n4. Divide(/)\n5. Exponent(^)\n6. Modulo or Remainder(%)"

print "\nPlease choose one operator(name or symbol): "
operator = gets.chomp.downcase.to_s

#User Operator Input Check
until operators.include?(operator)
    puts "Invalid Entry"
    print "Please choose one operator(name or symbol): "
    operator = gets.chomp.downcase.to_s
end

#User Number Input Check (Validates Number Input and Checks for Int or Float)
2.times do |i|
    print "Enter Number #{i+1}: "
    #Lines 68-73 Souce: https://medium.com/launch-school/number-validation-with-regex-ruby-393954e46797
    number = nil
    loop do
        number = gets.chomp
        break if number?(number)
        print "Invalid Entry\nEnter Number #{i+1}: "
    end
    numbers.push(data_type(number))
end

#Calculates Result
print "Result: "
case operator
when "+", "add", "1"
    puts addition(numbers[0], numbers[1])
when "-", "subtract", "2"
    puts subtraction(numbers[0], numbers[1])
when "*", "multiply", "3"
    puts multiplication(numbers[0], numbers[1])
when "/", "divide", "4"
    puts division(numbers[0].to_f, numbers[1].to_f)
when "^", "exponent", "5"
    puts exponent(numbers[0], numbers[1])
else
    puts remainder(numbers[0], numbers[1])
end
