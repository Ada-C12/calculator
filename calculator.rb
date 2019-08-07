puts "HELLO I AM CALCU-BOT. \nSELECT A MATH OPERATION."

operands = [
{id: 1, name: "ADDITION", symbol: "+"},
{id: 2, name: "SUBTRACTION", symbol: "-"},
{id: 3, name: "MULTIPLICATION", symbol: "*"},
{id: 4, name: "DIVISION", symbol: "/"},
{id: 5, name: "EXPONENTIATION", symbol: "^"},
{id: 6, name: "MODULO", symbol: "%"}
]

operands.each do |operand|
  puts "#{operand[:id]}. #{operand[:name]} #{operand[:symbol]}"
end

# will be assigned user-inputted operator
math_operand = "none"

while math_operand == "none"
  user_operand = gets.chomp.upcase
  
  # truncate user_operand for use in case block
  # accounts for if a user inputs "divide" or "division" (both begin with DIV)
  user_operand = user_operand[0..2]
  
  case user_operand
  when "1", "ADD", "+"
    puts "YOU HAVE CHOSEN ADDITION."
    math_operand = :+
  when "2", "SUB", "-"
    puts "YOU HAVE CHOSEN SUBTRACTION."
    math_operand = :-
  when "3", "MUL", "*"
    puts "YOU HAVE CHOSEN MULTIPLICATION."
    math_operand = :*
  when "4", "DIV", "/"
    puts "YOU HAVE CHOSEN DIVISION."
    math_operand = :/
  when "5", "EXP", "^"
    puts "YOU HAVE CHOSEN EXPONENTIATION."
    math_operand = :**
  when "6", "MOD", "%"
    puts "YOU HAVE CHOSEN MODULO-IFICATION. \n(CALCU-BOT DOES NOT KNOW THE VERB TENSE FOR A MODULO.)"
    math_operand = :%
  else
    puts "CALCU-BOT HAS ENCOUNTERED AN ERROR. SELECT A MATH OPERATION."
    math_operand = "none"
  end
end

# ensure a value is an integer or float
class String
  def integer_checker
    self.to_i.to_s == self
  end
  def float_checker
    self.to_f.to_s == self
  end
end


# returns error message until user inputs an integer or float
def class_check(num)
  until num.integer_checker || num.float_checker
    puts "ERROR. NOT A NUMBER. TRY AGAIN."
    num = gets.chomp
  end  
  if num.float_checker
    return num.to_f
  elsif num.integer_checker
    return num.to_i
  end
end

puts "ENTER THE FIRST NUMBER."
first_num = gets.chomp
first_num = class_check(first_num)

puts "ENTER THE SECOND NUMBER."
second_num = gets.chomp

# throw error if trying to divide by 0
if second_num.to_f == 0 && math_operand == :/
  while second_num.to_f == 0
    puts "CALCU-BOT CANNOT DIVIDE BY ZERO. ENTER ANOTHER NUMBER."
    second_num = gets.chomp
  end
end

second_num = class_check(second_num)


puts "CALCU-BOT HAS CALCULATED THE CALCULATION."

def operate_numbers(symbol, num1, num2)
  result = num1.public_send(symbol, num2)
  # print result
  puts "#{num1} #{symbol} #{num2} = #{result}"
end

operate_numbers(math_operand, first_num, second_num)
