# Calculator Program

# stores valid input options for math operations
valid_maths = [
  "add",
  "+",
  "subtract",
  "-",
  "multiply",
  "*",
  "divide",
  "/",
  "exponent",
  "^",
  "modulo",
  "%"
]

# method for text displaying available math options
def maths_text
  puts "  Add (+)"
  puts "  Subtract (-)"
  puts "  Multiply (*)"
  puts "  Divide (/)"
  puts "  Exponent (^)"
  puts "  Modulo (%)"
end  

# displays welcome message
puts "Welcome to the Calculator Program!"

# displays available math operations 
# asks user to input a math operation
puts "Please select one of the following options: "
maths_text
print "Selection: "
operation = gets.chomp.downcase

until valid_maths.include?(operation)
  puts "I can't do that. I only know how to:"
  maths_text
  print "Which operation do you want me to perform? "
  operation = gets.chomp.downcase
end

# asks user to provide a number
print "First number: "
num_1 = gets.chomp
until num_1.to_i.to_s == num_1 || num_1.to_f.to_s == num_1
  puts "That's not a number. Try again."
  print "First number: "
  num_1 = gets.chomp
end

# asks user to provide a second number
print "Second number: "
num_2 = gets.chomp
until num_2.to_i.to_s == num_2 || num_2.to_f.to_s == num_2
  puts "That's not a number. Try again."
  print "Second number: "
  num_2 = gets.chomp
end

# asks user to state if result should be integer or float
print "Do you want the result as an integer? "
result_integer = gets.chomp.downcase

case result_integer
  when "yes", "y"
    num_1 = num_1.to_i
    num_2 = num_2.to_i
  when "no", "n"
    num_1 = num_1.to_f
    num_2 = num_2.to_f
end

# executes and prints math operation
puts "\n--CALCULATION--"
case operation
  when "add", "+"
    result = num_1 + num_2
    puts "#{num_1} + #{num_2} = #{result}"
  when "subtract", "-"
    result = num_1 - num_2
    puts "#{num_1} - #{num_2} = #{result}"
  when "multiply", "*"
    result = num_1 * num_2
    puts "#{num_1} * #{num_2} = #{result}"
  when "divide", "/"
    if num_2 == 0
      puts "ERROR -- You can't divide by 0!"
    else  
      result = num_1 / num_2
      puts "#{num_1} / #{num_2} = #{result}"
    end
  when "exponent", "^"
    result = num_1 ** num_2.to_i
    puts "#{num_1} ^ #{num_2} = #{result}"
  when "modulo", "%"
    result = num_1 % num_2
    puts "#{num_1} % #{num_2} = #{result}"
end    
