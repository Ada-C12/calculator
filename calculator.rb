#operation methods
def add(num1, num2)
  return num1 + num2
end

def subtract(num1, num2)
  return num1 - num2
end

def multiply(num1, num2)
  return num1 * num2
end

def divide(num1, num2)
  return num1 / num2
end

def modulo(num1, num2)
  return num1 % num2
end

def exponent(num1, num2)
  return num1 ** num2
end

#request number methods
def requestNum1
  puts "We will be working with two numbers. Please enter your first number:"
  num = gets.chomp
  
  return num
end

def requestNum2
  puts "Please enter your second number:"
  num = gets.chomp
  
  return num
end

valid = false
OPERATIONS = ["add", "+", "subtract", "-", "multiply", "*", "divide", "/", "modulo", "%", "exponent", "**"]

puts "Welcome to the Calculator program! Which operator would you like to use?"

puts "1. add(+)"
puts "2. subtract(-)"
puts "3. multiply(*)"
puts "4. divide(/)"
puts "5. modulo(%)"
puts "6. exponent(**)"



while valid == false 
  
  puts "Please choose an operator(name or symbol):"
  operator = gets.chomp
  operator = operator.downcase
  
  if OPERATIONS.include? operator
    num1 = requestNum1
    isFloat = Float(num1) rescue false
    
    if isFloat
      num2 = requestNum2
      isFloat = Float(num2) rescue false
      
      if isFloat
        case operator
        when "add", "+"
          result = add(num1.to_f, num2.to_f)
          
          if result % 1 == 0
            result = result.to_i
          end
          
          puts "#{num1} + #{num2} = #{result}"
          valid = true
        when "subtract", "-"
          result = subtract(num1.to_f, num2.to_f)
          
          if result % 1 == 0
            result = result.to_i
          end
          
          puts "#{num1} - #{num2} = #{result}"
          valid = true
        when "multiply", "*"
          result = multiply(num1.to_f, num2.to_f)
          
          if result % 1 == 0
            result = result.to_i
          end
          
          puts "#{num1} * #{num2} = #{result}"
          valid = true
        when "divide", "/"
          if num2.to_f != 0.0
            result = divide(num1.to_f, num2.to_f)
            
            if result % 1 == 0
              result = result.to_i
            end
            
            puts "#{num1} / #{num2} = #{result}"
          else
            puts "The result is undefined."
          end
          valid = true
        when "modulo", "%"
          if num2.to_f != 0.0
            result = modulo(num1.to_f, num2.to_f)
            
            if result % 1 == 0
              result = result.to_i
            end
            
            puts "#{num1} % #{num2} = #{result}"
          else
            puts "The result is undefined."
            valid = true
          end
          
        when "exponent", "**"
          result = exponent(num1.to_f, num2.to_f)
          
          if result % 1 == 0
            result = result.to_i
          end
          
          puts "#{num1}^#{num2} = #{result}"
          valid = true
        end
        
      else
        puts "That is not a valid input."
        valid = true
      end
      
    else
      puts "That is not a valid input."
      valid = true
    end
  else 
    puts "That is not a valid operator. Please input a valid operator."
    puts
    
  end
end

