# A program that allows the user to perform simple arithmetic
# 8/6/19
# Hallie Johnson

require 'colorize'

# Header
puts "WELCOME TO THE CALCULATOR PROGRAM!\n".colorize(:yellow)

# Initialize variables
operator = nil
valid = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

num_array = [nil, nil]

# Obtain operator selection from user
until valid.include?(operator)
  puts "Which operator would you like to use?"
  puts "1. add(+)"
  puts "2. subtract(-)"
  puts "3. multiply(*)"
  puts "4. divide(/)\n"
  print "Entry: "
  
  operator = gets.chomp.downcase
  
  unless valid.include?(operator)
    puts "You must enter a valid operator. Please try again.\n".colorize(:red)
  end
end 

# Ask user for numbers
num_array.length.times do |i|
  until num_array[i].is_a?(Integer)
    print "\nPlease provide a number: "
    
    num_array[i] = Integer(gets) rescue nil
    
    unless num_array[i].is_a?(Integer)
      print "You must enter a valid number.".colorize(:red)
    end
  end
end

# Method to execute operation (note: learned about "send" method on StackOverflow)
def calculate operator, num1, num2
  puts "#{num1} #{operator} #{num2} = #{num1.send(operator, num2)}"
end

# Perform operation and display result
case operator
when "add", "+"
  calculate "+", num_array[0], num_array[1]
  
when "subtract", "-"
  calculate "-", num_array[0], num_array[1]
  
when "multiply", "*"
  calculate "*", num_array[0], num_array[1]
  
when "divide", "/"
  if num_array[1] == 0
    puts "Sorry, friend. You can't divide a number by zero.\n"
  elsif num_array[0] % num_array[1] != 0
    calculate "/", num_array[0].to_f, num_array[1]
  end
end
