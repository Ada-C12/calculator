# method for input validation of numbers
#new_num = nil # serves as a placeholder variable in case the user has to re-enter any numbers during the number_validation method

def number_validation (input)
  eval_num = nil  
  until eval_num == "Pass" do
    # transforms a copy of the user input to check against the original value
    input_v = input.to_f*100
    input_v = input_v.to_i.to_s
    input_w = input.delete(".")
    if input == input.to_f.to_s
      eval_num = "Pass"
    elsif input == input.to_i.to_s
      eval_num = "Pass"
    elsif input_v == input_w    
      eval_num = "Pass"
    else
      print "Oh nos! You entered some non-number character. Enter a new one: "
      input = gets.chomp
    end
  end 
  return input
end

# stores possible user inputs for mathematical operators
addition = %w[ADDITION ADD +]
subtraction = %w[SUBTRACTION MINUS -]
multiplication = %w[MULTIPLY MULTIPLICATION TIMES X *]
division = %w[DIVISION DIVIDE /]
exponent = %w[EXPONENT POWER ^ **]

# greets the user and asks for an operator they'd like to use
print "Hi, enter a mathematical operation you'd like to do: "
operation = gets.chomp.upcase

#evaluates the user input to see if it's valid
until addition.include?(operation) || subtraction.include?(operation) || multiplication.include?(operation) || division.include?(operation) || exponent.include?(operation)
  print "This is not a valid operator, please try again: "  
  operation = gets.chomp.upcase
end

# gets the user's numbers and validates them
print "Enter the first number: "
input = gets.chomp
new_input = number_validation(input)
first_num = new_input  

# gets the user's numbers and validates them
print "Enter the second number: "
input = gets.chomp
new_input = number_validation(input)
second_num = new_input  

# runs the calculation and displays for the user the work
case 
when addition.include?(operation)
  puts "#{first_num.to_f} + #{second_num.to_f} = #{first_num.to_f + second_num.to_f}"
when subtraction.include?(operation)
  puts "#{first_num.to_f} - #{second_num.to_f} = #{first_num.to_f - second_num.to_f}"
when multiplication.include?(operation)
  puts "#{first_num.to_f} x #{second_num.to_f} = #{first_num.to_f * second_num.to_f}"
when division.include?(operation)
  puts "#{first_num.to_f} / #{second_num.to_f} = #{first_num.to_f / second_num.to_f}"
  if second_num.to_f == 0.0
    puts "So...it is infinity, but next time, let's not try dividing by zero, yea? "
  end
when exponent.include?(operation)
  puts "#{first_num.to_f} ** #{second_num.to_f} = #{first_num.to_f ** second_num.to_f}"
end
