# 1st method - evaluate_oper(operator): evaluate user input to see if it is one of the four avaliable operators (either symbol or word) for this calculator program. If yes, method will return the input; if no, method will display error message. Assumption: only lowercase input
def evaluate_oper(operator)
  if ["add", "+", "subtract", "-", "multiply", "*", "divide", "/"].include?(operator)
    return operator
  else
    return "This is an invalid input"
  end
end
# 2nd method - evaluate_num(number): evaluate user input to see if it is a number. Prior - all input are strings; Post - all input are converted into float [number will remain float; letter will become 0; expect for integer 0]. Assumption: don't need to handle 0 for this assignment *** TA Kaida helped me on this method
def evaluate_num(number)
  if number.to_f == 0.0 && number != "0.0"
    return "This is an invalid input"
  else
    return number
  end
end
# 3rd method - operation(a,b,c): take variable a to compare against the four available operators and return corresponding calculation of numbers b and c. Assumption: input for a is one of the four available operators
def operation(a,b,c)
  if a == "add" || a == "+"
    return b + c
  elsif a == "subtract" || a == "-"
    return b - c
  elsif a == "multiply" || a == "*"
    return b * c
  else
    return b / c
  end
end
# Main program
puts "Weclome to my calculator!\nPlease choose one operator from below (either name or symbol;lowercase only please).\n1. add(+)\n2. substract(-)\n3. multiply(*)\n4. divide(/) \n"
puts "What is your chosen operator?"
input1 = gets.chomp
result1 = evaluate_oper(input1)
if result1 == "This is an invalid input"
  puts "Invalid input. Bye Bye"
else
  puts "What is your first number?"
  input2 = gets.chomp
  result2 = evaluate_num(input2)
  if result2 == "This is an invalid input"
    puts "Invalid input. Bye Bye"
  else
    puts "What is your second number?"
    input3 = gets.chomp
    result3 = evaluate_num(input3)
    if result3 == "This is an invalid input"
      puts "Invalid input. Bye Bye"
    elsif (result1 == "/" || result1 == "divide") && (result3 == 0 || result3 == 0.0)
      puts "Invalid input. Bye Bye"
    else
      final_result = operation(result1,result2.to_f,result3.to_f)
      puts "Your calculation is #{final_result}"
    end
  end
end
