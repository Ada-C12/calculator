
def newline
  puts "\n"
end

newline
puts "Welcome to the calculator program! Here are the operators you can use:"
puts "  add (+)"
puts "  subtract (-)"
puts "  multiply (*)"
puts "  divide (/)"
puts "  exponify (**)"

print "\nWhich operator would you like to use? Enter the name or symbol: "
command = gets.chomp.downcase

print "\nWhat is your first number for this operation? "
first_num = gets.chomp.downcase

# Tried to create a custom method but I couldn't get it to work :(
# Learned in class: "puts" in a method is a no-no

# def string_thing(string)
#   if string.empty?
#     return puts "\nSorry, that is not a valid number. Exiting program."
#   else string = string.to_f
#   end
# end

# Tried to create an array of letters that I could use as object
# in include? method (after converting input to an array of single letters)
# but couldn't make that work either. 
# Include? works fine with a literal but maybe it doesn't work with
# an array as object?

# first_num_array = first_num.split(//)
# puts first_num_array

# letters = Array ('a'..'z') 
# # puts letters

# if first_num.empty? 
#   return puts "\nOops, that is not a valid number. Exiting program."  
# elsif first_num_array.include?(letters)
#   return puts "\nOops, that is not a valid number. Exiting program."    
# else
#   first_num = first_num.to_f  
# end

# Another failed attempt ... 

# def validate(number)
#   if number.empty? 
#     return puts "\nOops, that is not a valid number. Exiting program."  
#   elsif number.include?("a") 
#     return puts "\nOops, that is not a valid number. Exiting program."   
#   elsif number.include?("b") 
#     return puts "\nOops, that is not a valid number. Exiting program."   
#   elsif number.include?("c") 
#     return puts "\nOops, that is not a valid number. Exiting program."   
#   elsif number.include?("d") 
#    ...
#   else
#     number = number.to_f  
#   end
# end

# validate(first_num)

# And another thing that didn't work ...

# if first_num.empty? 
#   return puts "\nOops, that is not a valid number. Exiting program."  
# elsif first_num.include?("a") 
#   return puts "\nOops, that is not a valid number. Exiting program."   
# elsif first_num.include?("b") 
#   return puts "\nOops, that is not a valid number. Exiting program."   
# elsif first_num.include?("c") 
#   return puts "\nOops, that is not a valid number. Exiting program."   
# ...
# else
#   first_num = first_num.to_f  
# end

# Implementing rescue false method discussed in class.

def numeric?(object)
  true if Float(object) rescue false
end

if first_num.empty? 
  return puts "\nOops, that is not a valid number. Exiting program."  
elsif !numeric?(first_num)
  return puts "\nOops, that is not a valid number. Exiting program."  
else first_num = first_num.to_f
end

print "What is your second number for this operation? "
second_num = gets.chomp

if second_num.empty? 
  return puts "\nOops, that is not a valid number. Exiting program."  
elsif !numeric?(second_num)
  return puts "\nOops, that is not a valid number. Exiting program."  
else second_num = second_num.to_f
end

case command
when "add", "+", "adding", "(+)"
  puts "All right, we're adding numbers!"
  puts "#{first_num} + #{second_num} = #{first_num + second_num}"
when "subtract", "-", "subtracting", "(-)"
  puts "Sweet, we're subtracting numbers!"
  puts "#{first_num} - #{second_num} = #{first_num - second_num}"
when "multiply", "*", "multiplying", "(*)"
  puts "Marvelous, we're multiplying numbers!"
  puts "#{first_num} * #{second_num} = #{first_num * second_num}"
when "divide", "/", "dividing", "(/)"
  puts "How delightful, we're dividing numbers!"
  if second_num == 0
    return puts "When you divide by zero, the result is ... infinity. Whoa."
  end
  puts "#{first_num} / #{second_num} = #{first_num / second_num}"
when "exponify", "**", "exponential", "exponentialize", "exponentialise", "(**)"
  puts "Excellent, we're exponentiating numbers!"
  puts "#{first_num} ** #{second_num} = #{first_num ** second_num}"
else
  return puts "Sorry, you didn't enter a valid operator. Exiting program."
end

newline
