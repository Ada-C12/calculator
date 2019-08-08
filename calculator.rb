# Methods
def add (num1, num2)
  return num1 + num2
end

def subtract (num1, num2)
  return num1 - num2
end

def multiply (num1, num2)
  return num1 * num2
end

def divide (num1, num2)
  return num1 / num2
end 

def exponent (num1, num2)
  return num1 ** num2
end 

def modulo (num1, num2)
  return num1 % num2
end 

def num_check (num)
  until num.to_f.to_s == num.to_s || num.to_i.to_s == num.to_s
    puts "That number is invalid. Please try again: "
    num = gets.chomp 
  end
  return num.to_f
end 

def float_int_check (num)
  if num == num.to_i
    return num.to_i
  else return num
  end
end 

# Intro and get user input
puts "Welcome to your handy dandy calculator!"
print "What would you like to do? 
Add (+), Subtract (-), Multiply (*), Divide (/), Exponent (^), or Modulo (%)? "
oper = gets.chomp.upcase

# Check for valid user input by checking it against array of valid operations/symbols
operations = ["ADD", "+", "SUBTRACT", "-", "MULTIPLY", "*", "X", "DIVIDE", "/", 
  "EXPONENT", "^", "**", "MODULO", "MODULUS", "REMAINDER", "%"]
  until operations.include?(oper)
    print "That operation is invalid. Please try again: "
    oper = gets.chomp.upcase
  end 
  
  # Addition
  if oper == "ADD" || oper == "+"
    puts "What is your first number? "
    num1 = gets.chomp
    num1 = num_check(num1)
    
    puts "What number would you like to add to #{float_int_check(num1)}? "
    num2 = gets.chomp
    num2 = num_check(num2)
    
    puts "#{float_int_check(num1)} + #{float_int_check(num2)} = #{float_int_check(add(num1, num2))}"
    
    # Subtraction
  elsif oper == "SUBTRACT" || oper == "-"
    puts "What is your first number? "
    num1 = gets.chomp
    num1 = num_check(num1)
    
    puts "What number would you like to subtract from #{float_int_check(num1)}? "
    num2 = gets.chomp
    num2 = num_check(num2)
    
    puts "#{float_int_check(num1)} - #{float_int_check(num2)} = #{float_int_check(subtract(num1, num2))}"
    
    # Multiplication
  elsif oper == "MULTIPLY" || oper == "*" || oper == "X" # included this last option just in case
    puts "What is your first number? "
    num1 = gets.chomp
    num1 = num_check(num1)
    
    puts "What number would you like to multiply #{float_int_check(num1)} by? "
    num2 = gets.chomp
    num2 = num_check(num2)
    
    puts "#{float_int_check(num1)} * #{float_int_check(num2)} = #{float_int_check(multiply(num1, num2))}"
    
    # Division
  elsif oper == "DIVIDE" || oper == "/" 
    puts "What number is your dividend? "
    num1 = gets.chomp
    num1 = num_check(num1)
    
    puts "What number is your divisor, that you'd like to divide #{float_int_check(num1)} by? "
    num2 = gets.chomp
    while num2 == "0"
      puts "You cannot divide by zero. Please re-enter the divisor: "
      num2 = gets.chomp
    end 
    num2 = num_check(num2)
    
    puts "#{float_int_check(num1)} / #{float_int_check(num2)} = #{float_int_check(divide(num1, num2))}"
    
    # Exponent
  elsif oper == "EXPONENT" || oper == "^"
    puts "What number is your base? "
    num1 = gets.chomp
    num1 = num_check(num1)
    
    puts "What number is your exponent, the power you would like to raise #{float_int_check(num1)} to? "
    num2 = gets.chomp
    num2 = num_check(num2)
    
    puts "#{float_int_check(num1)} ^ #{float_int_check(num2)} = #{float_int_check(exponent(num1, num2))}" 
    
    # Modulo
  elsif oper == "MODULO" || oper == "MODULUS" || oper == "REMAINDER" || oper == "%" # Added some extra names for this in case
    puts "What is your first number? "
    num1 = gets.chomp
    num1 = num_check(num1)
    
    puts "What is your second number? "
    num2 = gets.chomp
    while num2 == "0"
      puts "You cannot use zero. Please re-enter: "
      num2 = gets.chomp
    end 
    num2 = num_check(num2)
    puts "When you divide #{float_int_check(num1)} by #{float_int_check(num2)}, you have #{float_int_check(modulo(num1, num2))} left over."
  end 
  
