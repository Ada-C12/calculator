# Calculator.rb assignment

# array of arrays 
operators = [
  ["add", "+"], 
  ["subtract", "-"], 
  ["multiply", "*"], 
  ["divide", "/"]
]

# added this operator_check long array to ensure user's input is only valid if on this list
operators_check = 
  ["add", "+", 
  "subtract", "-", 
  "multiply", "*", 
  "divide", "/"]

# only accept digits as input
def is_number(string)
  if string.length == 0
    return false
  end
  return string.scan(/\D/).empty?
end

# welcome user to program, provide list of oeprators, looping through list options
puts "Welcome to the Calculator program!"
puts "Which operator would you like to use from the below list?"
4.times do |i|
  puts "#{i+1}: #{operators[i][0]} (#{operators[i][1]})"
end

# get user's operator pick and reinstate. Throw error if selection is not on offered list
puts "Enter your chosen operator now (name or symbol)."
operator_pick = gets.chomp
# use method.include to throw error if user input is not on the operator list and prompt user to try again
until operators_check.include?(operator_pick)
  puts "ERROR: invalud entry. Please selection operator from list."
  puts "Enter your chosen operator now (name or symbol)."
  operator_pick = gets.chomp
  puts "You've selected the #{operator_pick} operator."
end

# get user's first number and reinstate. Error if less than 0
# initially used .to_i on gets.chomp but this converted string to 0
# instead, check if num_one_pick is a number, before calling to_i. If not a number, throw error
# include .to_f to handle float entries as well (but now all outputs are floats? hm)
puts "Next: select a number for this math operation."
num_one_pick = gets.chomp
if is_number(num_one_pick) == false
  puts "ERROR: this entry is not valid."
  puts "Next: select a number for this math operation."
  num_one_pick = gets.chomp
end
num_one_pick = num_one_pick.to_i.to_f

puts "You've selected #{num_one_pick} as your first number."
puts "#{num_one_pick} is a great number."

# get user's second number and reinstate. Error if less than 0
puts "Finally: select your second number for the Calculator."
num_two_pick = gets.chomp
if is_number(num_two_pick) == false
  puts "ERROR: this entry is not valid."
end

# prevent division by 0 and throw error if occurs
if num_two_pick == "0" && (operator_pick == "divide" || operator_pick == "/")
  puts "ERROR: cannot divide by zero."
end
num_two_pick = num_two_pick.to_i.to_f

puts "You've selected #{num_two_pick} as your second number."
puts "#{num_two_pick} is also a great number."

# wrap up and reinstate equation, along with solution
puts "You have created the following problem: #{num_one_pick} #{operator_pick} #{num_two_pick}"
puts "The solution to your problem is: "

# use case command to complete equation
case operator_pick
  when "add", "+"
puts (num_one_pick + num_two_pick)
  when "subtract", "-"
puts (num_one_pick - num_two_pick)
  when "multiply", "*"
puts (num_one_pick * num_two_pick)
  when "divide", "/"
puts (num_one_pick / num_two_pick)
end 
