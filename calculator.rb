def add(num_1, num_2)
  return  "\n#{num_1} + #{num_2} = #{num_1 + num_2} "
end
def substract(num_1, num_2)
  return "\n#{num_1} - #{num_2} = #{num_1 - num_2} "
end
def multiply(num_1, num_2)
  return "\n#{num_1} * #{num_2} = #{num_1 * num_2} "
end
def divide(num_1, num_2)
  return "\n#{num_1} / #{num_2} = #{num_1 / num_2} "
end

operator_array = ["add","+", "substract","-", "multiply","*", "divide","/"]
puts  "\nWelcome to the Calculator Program!"
print "How many operations would you like to do?: " 
operator_num = gets.chomp

while operator_num !~ /^-?[0-9]+$/
  puts "NUMBERS ONLY!!!!!"
  print "\nHow many operations would you like to do?: " 
  operator_num = gets.chomp
end 
operator_num = operator_num.to_i

operator_num.times do |i|
  puts "\n\nWhich operator would you like to use?"
  puts "\n1. add (+)\n2. substract (-)\n3. multiply (*)\n4. divide (/)"
  print "\n##{i + 1} Please choose one operator(name or symbol): "
  operator = gets.chomp

  while  !operator_array.include?(operator)
    puts "Please enter valid operator:"
    print "\n##{i + 1} Please chooce one operator(name or symbol): "
    operator = gets.chomp
  end
  operator = operator.downcase

  if operator_array.include?(operator)
    print "\nEnter your first number: "
    num_1 = gets.chomp
    while num_1 !~ /^-?[0-9]+$/
      puts "NUMBERS ONLY!!!!!"
      print "\nEnter your first number: "
      num_1 = gets.chomp
    end 
    num_1 = num_1.to_i
  end
  print "\nEnter your second number: "
  num_2 = gets.chomp

  while num_2 !~ /^-?[0-9]+$/
    puts "NUMBERS ONLY!!!!!"
    print "\nEnter your second number: "
    num_2 = gets.chomp
  end 
  num_2 = num_2.to_i

  if operator == "add" || operator == "+"
    puts add(num_1, num_2)
  elsif operator == "substract" || operator == "-" 
    puts substract(num_1, num_2)
  elsif operator == "multiply" || operator == "*" 
    puts multiply(num_1, num_2)
  elsif operator == "divide" || operator == "/" 
    begin
      puts divide(num_1, num_2)
    rescue ZeroDivisionError
      puts "Error"
    end
  i += 1
  end

  puts "\nThank you!!!"
end
