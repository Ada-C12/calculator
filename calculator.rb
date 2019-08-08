# direct user to enter first number
puts "I'm here to calculate some numbers for you. Let's do it!"
puts "Enter a number you'd like to work with."

# array for operators
o_array = ["+", "add", "subtract", "-", "multiply", "*", "divide", "/"]

# accept user input, verify integer, prompt to re-enter if invalid
begin
  entry1 = gets.chomp
  entry1 = Integer(entry1)
rescue ArgumentError
  puts "Entry invalid: value was not a number. Try again."
  retry
end

# prompt for user input type of operation
puts "Enter the word or symbol for the operation you would like to perform.

1. add or +
2. subtract or -
3. multiply or *
4. divide or /
"

# accept user input for operator, verify valid entry, prompt re-entry for invalid response
operator = gets.chomp
until o_array.include?(operator)
  puts "Entry invalid: entry was not a valid operator. Please enter the operator you would like to use."
  operator = gets.chomp
end

#accept input for second number, verify valid entry, prompt re-entry for invalid response
puts "Enter the second number you would like involved in your operation."

begin
  entry2 = gets.chomp
  entry2 = Integer(entry2)
rescue ArgumentError
  puts "Entry invalid: value was not a number. Try again"
  retry
end

# case method for executing operation selected
# include option in case of user attempting divisor as zero 
case operator
when "add", "+"
  operator = "+"
  puts "#{entry1} #{operator} #{entry2} = #{entry1 + entry2} "
when "subtract", "-"
  operator = "-"
  puts "#{entry1} #{operator} #{entry2} = #{entry1 - entry2}"
when "multiply", "*"
  operator = "*"
  puts "#{entry1} #{operator} #{entry2} = #{entry1 * entry2}"
when "divide", "/"
  operator = "/"
  if entry2 == 0
    puts "Undefined (cannot divide by zero)"
    exit
  end
  puts "#{entry1} #{operator} #{entry2} = #{entry1 / entry2}"
end


