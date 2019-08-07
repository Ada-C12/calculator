def number
  valid_input = false
  until valid_input
    print "Please enter number: "
    num = gets.chomp
    if num.to_i.to_s == num 
      valid_input = true
      return num
    else
      puts "Invalid number, please try again" 
    end
  end
end
  
valid_input = false
until valid_input
  puts %q(
  "Welcome to Dani's calculator."
  "Available math operations are:"
  "add(+)" 
  "subtract(-)" 
  "multiply(*)"
  "divide(/)"
  "Which one do you want to use? Please enter name or symbol: ")
  command = gets.chomp.downcase
  case command
    when "add", "+" 
      valid_input = true
      number1 = number().to_i
      number2 = number().to_i
      puts "#{number1} + #{number2} = #{number1 + number2}"
    when "subtract", "-"
      valid_input = true
      number1 = number().to_i
      number2 = number().to_i
      puts "#{number1} - #{number2} = #{number1 - number2}"
    when "multiply", "*"
      valid_input = true
      number1 = number().to_i
      number2 = number().to_i
      puts "#{number1} * #{number2} = #{number1 * number2}"
    when "divide", "/"
      valid_input = true
      number1 = number().to_i
      number2 = number().to_i
      if number2 = 0
        until number2 != 0
          puts "Invalid division. Enter new number"
          number2 = gets.chomp.to_i
        end
      end
      puts "#{number1} / #{number2} = #{number1 / number2}"    
    else
      puts "Invalid entry. Please try again"
      puts "\n"
  end
end

