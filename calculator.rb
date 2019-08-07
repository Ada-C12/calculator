# prints a welcome message to the user
print "Welcome to the calculating program! which operater you want to use \n \
1. add(+)\n 2. substract(-)\n 3. multiply(*)\n 4. divide(/)\n"

# prompt user to enter a math operater
print "Please enter a math operater (name or a symbol): "
math_operater = gets.chomp.downcase

# creates an array with list of maths operator
math_operators = ["+", "-", "/", "*", "add", "subtract", "multiply", "divide"]

# ask user to input an maths operater until its valid
until math_operators.include?(math_operater)
    puts"Invalid math operator! Please try again."
    print "Please enter a math operater: "
    math_operater = gets.chomp.downcase
end

# rescue clause catches the argument error 
begin
    print "Please enter the first number: "
    num_one = Integer(gets.chomp) 
rescue  ArgumentError  => e
    puts "You did not enter a a number. Try again!"
end

until num_one.is_a? Numeric
   
    # rescue clause catches the argument error 
    begin
        print "Please enter the first number: "
        num_one = Integer(gets.chomp)
    rescue  ArgumentError  => e
        puts "You did not enter a a number. Try again!"
    end
end

# rescue clause catches the argument error 
begin
    print "Please enter the second number: "
    num_two = Integer(gets.chomp)
rescue  ArgumentError  => e
    puts "You did not enter a a number. Try again!"
end

until num_two.is_a? Numeric
 
    # rescue clause catches the argument error 
    begin
        print "Please enter the second number: "
        num_two = Integer(gets.chomp)
    rescue  ArgumentError  => e
        puts "You did not enter a a number. Try again!"
    end
end

# prints the sum of number one and number two
if math_operater == "+" || math_operater == "add"
    sum = num_one + num_two
    puts "Result of #{num_one} + #{num_two} = #{sum}"

# prints difference of number one and number two
elsif math_operater == "-" || math_operater == "subtract"
    difference = num_one - num_two
    puts "Result of #{num_one} - #{num_two} =  #{difference}"

# prints product of number one and number two
elsif math_operater == "*" || math_operater == "multiply"
    product = num_one * num_two
    puts "Result of #{num_one} * #{num_two} =  #{product}"


elsif math_operater == "/" || math_operater == "divide"

    # rescue clause catches the Zero division error 
    begin
        quotient = num_one / num_two
        # prints quotient of number one and number two
        puts "Result of #{num_one} / #{num_two} =  #{quotient}"
    rescue ZeroDivisionError => e
        puts "Cannot divide by zeror"
    end
    

# else
#     puts "Invalid entry."
    
end  
    

