#checks operator input 
def operator (user_operation)
  case user_operation
    when "add", "+"
      print "Plese enter your first number: "
      user_num1 = gets.chomp
      user_num1 = num_check (user_num1)

      print "Please enter your second number: "
      user_num2 = gets.chomp
      user_num2 = num_check(user_num2)
      
      addition(user_num1, user_num2)

    when "subtract", "-"
      print "Plese enter your first number: "
      user_num1 = gets.chomp
      user_num1 = num_check (user_num1)

      print "Please enter your second number: "
      user_num2 = gets.chomp
      user_num2 = num_check(user_num2)

      subtraction(user_num1, user_num2)

    when "multiply", "*"
      print "Plese enter your first number: "
      user_num1 = gets.chomp
      user_num1 = num_check (user_num1)

      print "Please enter your second number: "
      user_num2 = gets.chomp
      user_num2 = num_check(user_num2)

      multiplication(user_num1, user_num2)

    when "divide", "/"
      print "Plese enter your first number: "
      user_num1 = gets.chomp
      user_num1 = num_check (user_num1)

      print "Please enter your second number: "
      user_num2 = gets.chomp
      user_num2 = num_check(user_num2)

      division(user_num1, user_num2)

    else 
      puts "NOT AN OPERATOR!"
      exit
  end
end

#checks user input is an integer
def num_check (num)
  if num.to_f.to_s == num.to_s || num.to_i.to_s == num.to_s
    num = num.to_i
    return num
  else 
    puts "NOT A NUMBER!"
    exit
  end
end

#if addition
def addition (num1, num2)
    answer = num1 + num2
    return answer
end

#if subtraction
def subtraction (num1, num2)
    answer = num1 - num2
  return answer
end 

#if multiplication
def multiplication (num1, num2)
    answer = num1 * num2
  return answer
end 

#if division
def division (num1, num2)
  if num2 == 0
    puts "Cannot divide by 0."
    exit
  else 
    answer = num1 / num2
    return answer
  end
end 

#main code
puts "Welcome to the calculator! What operator would you like to use?"
puts "1. add(+)"
puts "2. subtract(-)"
puts "3. multiply (*)"
puts "4. divide (/)"
print "Please choose one operator(name or symbol): "

u_operator = gets.chomp

results = operator(u_operator)
puts results
