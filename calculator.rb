def div_num(num1, num2)
  unless num2 == 0
    return num1 / num2
  else
    puts "You can't really divide numbers by 0... Awkward.."
  end
end 

def check_num
  puts "Please enter an integer:"
  begin
    user_input = gets.chomp
    user_input = Integer(user_input) 
    return user_input
  rescue ArgumentError
    puts "Please enter a valid number:"
    retry
  end
end

menu = [
  "add",
  "+",
  "subtract",
  "-",
  "multiply",
  "*",
  "divide",
  "/"
]

puts "Welcome to the calculator!/n What do you want to do?\nYou can type the word or symbol."
puts "1. add(+)\n2. subtract(-)\n3. multiply(*)\n4. divide(/)"
operator = gets.chomp.downcase

until menu.include?(operator)
  puts "Sorry, that's not a valid option. What do you want to do?"
  operator = gets.chomp.downcase
end

num1 = check_num
num2 = check_num

case operator
when "add", "+"
  operator = "+"
  value = num1 + num2
  puts "#{num1} #{operator} #{num2}: #{value}"
when "subtract", "-"
  operator = "-"
  value = num1 + num2
  puts "#{num1} #{operator} #{num2}: #{value}"
when "multiply", "*"
  operator = "/"
  value = num1 + num2
  puts "#{num1} #{operator} #{num2}: #{value}"
when "divide", "/"
  operator = "/"
  value = div_num(num1, num2)
  puts "#{num1} #{operator} #{num2}: #{value}"
end 

