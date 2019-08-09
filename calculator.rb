#create a calculator program that asks for user input and runs file from command line

#define global scope variables
results = nil

#define all the operations to the user that is available to compute calculations
operations_list = {
"Addition": "+",
"Subtraction": "-",
"Multiplication": "*",
"Division": "/"
}

#define a list with the various names for the operations to use as user may use abbreviated operation terms
variations_list = ["addition", "add", "+", "subtraction", "subtract", "-", "multiplication", "multiply", "*", "division", "divide", "/"]

#method for checking if value is numeric
def is_number? string
    true if Float(string) rescue false
end

#method for calculating numbers
def calculations (operator, num1, num2)
    case operator
    when "addition", "add", "+"
        results = num1 + num2
        puts "Your answer is: " + results.to_s
    when "subtraction", "subtract", "-"
        results = num1 - num2
        puts "Your answer is: " + results.to_s
    when "multiplication", "multiply", "*"
        results = num1 * num2
        puts "Your answer is: " + results.to_s
    when "division", "divide", "/"
        #check to see if user is trying to divide by 0
        if num2 == 0
            #if num2 is 0, then tell user, not possible. That's rude and exit program. 
            puts "Looks like you're trying to divide by 0. You know that's mean. BYE BYE FELICIA!"
            exit 
            #else calculate 
            results = num1 / num2
            puts "Your answer is: " + results.to_s
        end 
    end 
end 

#welcome message and list of operations for user to pick from
puts "We gon' do some math!"
puts "Here is a list of types of math"
operations_list.each do |key, value|
  puts "#{key} (#{value})"
end

#ask user for operations for calculation
puts "What kind of math do you wanna do? "
user_operator = gets.chomp
#call on check_operator method to check if user entered a valid operation
if variations_list.include?(user_operator) == false
    while variations_list.include?(user_operator) == false
      puts  "Uhhh, we don't offer that service. Enter another math type (this time something we offer)."
      user_operator = gets.chomp
    end
end 

#ask use for first number for calculation
puts "Cool. Now, what's the first number you wanna calculate?"
user_num1 = gets.chomp
#check to see if input is valid (a number to use for computation)
if is_number?(user_num1) == false 
    while is_number?(user_num1) == false 
    puts "Ya answer is not numeric. Enter a number"
    user_num1 = gets.chomp
    end 
end 
#once input is confirmed to be numeric, convert to integer for calculating
user_num1 = user_num1.to_i

#ask use for first number for calculation
puts "Okay. What's the second number?"
user_num2 = gets.chomp
#check to see if input is valid (a number to use for computation)
if is_number?(user_num2) == false 
    while is_number?(user_num2) == false 
    puts "Ya answer is not numeric. Enter a number"
    user_num2 = gets.chomp
    end 
end 
#once input is confirmed to be numeric, convert to integer for calculating
user_num2 = user_num2.to_i

#if operations and numbers are all good, time to compute 
calculations(user_operator, user_num1, user_num2)

#exit calculator program
puts "Thanks for using some math with us. Bye bye now! :D"
exit 
