# Calculator Program

# Get Integer Method
def get_integer(word)
  print "Enter a #{word} number, non-numeric values will evaluate to 0: "
  int = gets.to_f
  # while int == 0
  #   print "Invalid Entry. Please enter a number: "
  #   int = gets.to_f
  # end
  return int
end


# Introduction
puts "Welcome to the calculator program!  Here are the available operators: "

operations =
{
  "add" => '+',
  "subtract" => '-',
  "multiply" => '*',
  "divide" => '/',
  "exponent" => '**',
  "modulo" => '%'
}

# List Choices
operations.each do |key,value|
  print "  #{key} (#{value})"
  puts
end

# Get operator from user
print "Which operator would you like to use: "
input = gets.chomp.downcase
check1 = operations.include? input
check2 = operations.has_value? input
if check1 == true
  operation = operations[input]
else
  operation = input
end

# Validate proper entry
until check1 == true || check2 == true do
  print "Invalid Input, Enter operator: "
  input = gets.chomp.downcase
  operation = operations[input]
  check1 = operations.include? input
  check2 = operations.has_value? input
  if check1 == true
    operation = operations[input]
  else
    operation = input
  end
end

# Get integers from user
int1 = get_integer("first")
int2 = get_integer("second")

# Evaluate and print answer
calculation = "#{int1} #{operation} #{int2}"

print "#{calculation} = "
puts eval(calculation)
