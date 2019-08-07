#Calculator Assignment

#created an array of all the possible operations
operations_array = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

#display a list of operations to the user
puts "Please select from below types of operations: "
puts "1. add (+)"
puts "2. subtract (-)"
puts "3. multiply (*)"
puts "4. divide (/)"

#give user an option to choose the type of operation
operation = gets.chomp

#check if input is valid by searching in the operations_array
until operations_array.include?(operation)
  puts "Please enter a valid input"
  operation = gets.chomp
end

#a method to check if the input from the user is valid 
def check_number
  input = gets.chomp
  until input =~ /\d/ 
    puts "Enter a valid number"
    input = gets.chomp
  end
  return input.to_f
end

#call the method on user input to verify for valid input
puts "Enter your first number"
num1 = check_number

puts "Enter your second number"
num2 = check_number

#case when syntax that checks which operation to perform based on the value of the variable operation
case operation
  when "add", "+"
    puts "#{num1 + num2}"
  when "subtract", "-"
    puts "#{num1 - num2}"
  when "multiply", "*"
    puts "#{num1 * num2}"
  when "divide", "/" 
    # puts "#{num1 / num2}"
    if num2 == 0 
      puts "infinity"
    else
      puts "#{num1 / num2}"
    end
end

