def prompt_operator
  puts "enter a math operation"
  operator = gets.chomp
end

def prompt_number
  begin
    puts "enter a number for the math operation"
    Float(gets.chomp) 
  rescue ArgumentError
    puts "invalid number"
    retry
  end
end

x = prompt_number
y = prompt_number
operator = prompt_operator

while
  case operator
    when "add", "+"
      puts x + y
    when "subtract", "-"
      puts x - y
    when "multiply", "*"
      puts x * y
    when "divide", "/"
      puts x / y
    else
      puts "invalid operator"
      operator = prompt_operator
  end
end
