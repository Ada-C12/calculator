def getNumber(prompt)
    # keep prompting user for a number and once valid response is given, return as float
    number_valid = false
    while number_valid == false
        print "#{prompt}"
        number = gets.chomp
        
        begin
            number = Float(number)
            #puts "\tSuccess, number valid!"
            number_valid = true
        rescue => exception
            puts "\tInvalid, try again"
        end
        
    end
    return number
end

def makeFormula (num1, operation, num2)
    # return string representation of the math formula
    formula = ""
    plugs = [num1.to_s, " ", operation, " ", num2.to_s]
    plugs.each do |item| 
        formula << item
    end
    #puts "returning formula #{formula}"
    return formula
end

############## START PROGRAM HERE ###################
puts "", "HI! LET'S CALCULATE SOME STUFF!", ""

operations = %w[ADD(+) SUBTRACT(-) MULTIPLY(*) DIVIDE(/) EXPONENT(^) MODULO(%)]
acceptables = [%w[1 ADD +], %w[2 SUBTRACT -], %w[3 MULTIPLY *], %w[4 DIVIDE /], %w[5 EXPONENT ^], %w[6 MODULO %]]
operation = ""
int_or_flt = nil
formula = ""
result = ""
div_zero_msg = [nil, "You can't divide by zero!"]

op_choice_valid = false
while op_choice_valid == false
    # show menu of operations
    puts "Please select from one of the following:"
    operations.length.times do |index|
        puts "\t#{index + 1}:\t#{operations[index]}"
    end
    print ">>> "
    
    # if valid, match user input to the string symbol equivalent (+-&/% etc) 
    op_choice = gets.chomp.upcase 
    acceptables.each do |acceptable_inputs|
        if acceptable_inputs.include? op_choice
            op_choice_valid = true
            operation = acceptable_inputs[-1]
            #puts "success, #{operation}"
        end
    end
    
    if op_choice_valid == false
        puts "Invalid.  Please enter in the menu number, operation, or symbol"
    end
end
puts ""

# get valid num1 and num2 as floats
num1 = getNumber("First number = ")
num2 = getNumber("Second number = ")

# does user want int or float answers?
while int_or_flt == nil
    print "Do you want the answer as an integer or a float? >>> "
    choice = gets.chomp.upcase
    if choice.include? "I"
        int_or_flt = "I"
    elsif choice.include? "F"
        int_or_flt = "F"
    else
        puts "Invalid, try again"
    end
end

# make string formula depending on int or float, change num1 and num2 to integer if needed
if int_or_flt == "F"
    formula = makeFormula(num1, operation, num2)
elsif int_or_flt == "I"
    num1 = num1.round
    num2 = num2.round
    formula = makeFormula(num1, operation, num2)
else
    puts "Impossible, check code for errors"
end

# perform the math and store in result
case operation
when "+"
    result = num1 + num2
when "-"
    result = num1 - num2
when "*"
    result = num1 * num2
when "/"
    num2 == 0 ? (div_zero_msg[0] = true) : (result = num1 / num2)
when "^"
    result = num1 ** num2
when "%"
    num2 == 0 ? (div_zero_msg[0] = true) : (result = num1 % num2)
else 
    puts "Error, shouldn't see this"
end

# print final answer
if div_zero_msg[0]
    puts "#{formula} = #{div_zero_msg[1]}"
else
    puts "########################", "#{formula} = #{result}", "########################"
end

puts "", ""





## Add support for parentheticals, i.e. 10 / (5 + 5) = 1.
    # recursion? ugh
