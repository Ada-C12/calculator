# display options for calculating
puts "Welcome to the calculator!"
puts "Which math do you want to do?"
puts "+ : add"
puts "- : subtract"
puts "* : multiply"
puts "/ : divide"
puts "^ : exponify"

# keep asking for user input until a valid option is chosen
math_choice = ""
valid_choice = false
until valid_choice == true do
  math_choice = gets.chomp
  case math_choice
  when "+", "add"
    math_choice = "+"
    valid_choice = true
  when "-", "subtract"
    math_choice = "-"
    valid_choice = true 
  when "*", "multiply", "times"
    math_choice = "*"
    valid_choice = true
  when "/", "divide"
    math_choice = "/"
    valid_choice = true
  when "^", "exponify", "**"
    math_choice = "**"
    valid_choice = true
  else
    puts "pick one of the valid options!"
  end
end

# method to check if input is a number:
def checkif_valid_num(input)
  valid_num = false
  # puts "Input was: #{input}, type: #{input.class}"
  until valid_num == true do
    if input == input.to_i.to_s
      input = input.to_i
      valid_num = true
    elsif input == input.to_f.to_s
      input = input.to_f
      valid_num = true
    else
      puts "That's not a valid entry, please enter a number:"
      input = gets.chomp
    end
  end
  return input
end

# ask user for first number they want to use in the math operation until valid
puts "Enter the first number:"
first_number = checkif_valid_num(gets.chomp)

# ask user for second number they want to use in the math operation until valid
puts "Enter the second number:"
second_number = checkif_valid_num(gets.chomp)

# display the math formula(opt) and answer, then exit.
if second_number == 0 && math_choice == "/"
  puts "Sorry, can't divide by 0!"
elsif math_choice == "**"
  answer = first_number.send(math_choice,second_number)
  puts "#{first_number}^#{second_number} = #{answer}"
else
  answer = first_number.send(math_choice,second_number)
  puts "#{first_number} #{math_choice} #{second_number} = #{answer}"
end
