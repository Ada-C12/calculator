# check user input to chcek if it contains only numbers 
def check_number (number)
    until number.match(/\A\d+\z/) 
        puts "Invalid Operation.Please enter the number again"
        number = gets.chomp
    end 
    
    number.to_i 
end 

# perform math operations based on user input 
# display results to the user 

def calculator 
    valid_operations = ["add","+","subtract","-","multiply","*","divide","/"]
    
    # ask user for math operations 
    # check if operation is valid and if not ask for a new input 
    puts "What is the math operation?"
    operation = gets.chomp.strip.downcase 
    until valid_operations.include?(operation)
        puts "Please enter a valid operation"
        operation = gets.chomp
    end 
    
    
    # ask user for numbers and input validation 
    puts "What is the first number for the math operation?"
    number_one = gets.chomp.strip
    number_one = check_number(number_one)
    puts "What is the seccond number for the math operation?"
    number_two = gets.chomp.strip
    number_two = check_number(number_two)
    
    # use user input to do math operations  
    if operation == "add" || operation == "+"
        result = number_one + number_two 
        operation = "+"
    elsif operation == "subtract" || operation == "subtract"
        result = number_one - number_two 
        operation = "-"
    elsif operation == "multiply" || operation == "*"
        result = number_one * number_two 
        operation = "*"
    elsif operation == "divide" || operation == "/"
        result = number_one / number_two  
        operation = "/"
        
    end 
    
    
    # display result of calculation to user 
    puts " #{number_one} #{operation} #{number_two} = #{result}"
end 



calculator  
