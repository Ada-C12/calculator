print "Welcome to my calculator program! Please choose an operation 
you would like to calculate\n"

#Array with operations available
#At some point figure out how to print directly from array so as to not repeat myself with puts
# Change this into an array so a user could input other mathematical operations
operations = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"]

puts "1. add(+) "
puts "2. substract(-)"
puts "3. mulitply(*)"
puts "4. divide(/)"

# Ask user to describe what operation performed. YOu will have to build in a feature that 
#creates a way to check user input for correct format.

print "Please choose an operator (name or symbol)"
user_choice = gets.chomp
choice = false 
while choice == false
    if operations.include?(user_choice)
        choice = true
        puts "success"
    else
       puts "Please enter a correct operation"
       user_choice = gets.chomp
    end
end
 
# Ask user for their numbers, check if integer

print "What is your first number: "
begin
  num_one = gets.chomp
  num_one= Integer(num_one)
rescue ArgumentError
  print "Please enter a number:"
  retry
end
print num_one


print "What is your second number: "
begin
    num_two = gets.chomp
    num_two= Integer(num_two)
  rescue ArgumentError
    print "Please enter a number:"
    retry
  end
  print num_two


# Create Case Statement
case user_choice
when "add", "+"
    solution = (num_one + num_two).to_i
    puts "#{solution}"
when "subtract", "-"
    solution = (num_one - num_two).to_i
    puts "#{solution}"
when "multiply", "*"
    solution = (num_one * num_two).to_i
    puts "#{solution}"
when "divide", "/"
    solution = (num_one/num_two).to_f
    puts "#{solution}"
end
