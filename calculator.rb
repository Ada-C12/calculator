class Integer
  alias add +
  alias subtract -
  alias multiply *
  alias divide / 
end

def prompt_number
  puts "enter a number for the math operation"
  Float(gets.chomp) rescue "invalid input"
end

puts "enter a math operation"
operator = gets.chomp

x = prompt_number
y = prompt_number

puts x.send(operator, y) rescue "invalid input"
