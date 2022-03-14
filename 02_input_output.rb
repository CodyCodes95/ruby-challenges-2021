# Write a program that accepts someone's name and age, and responds
# as shown here:

# Program is run and outputs:
# "What is your name?"

# User inputs: "Tom"

# Program outputs:
# "Hi Tom! How old are you?"

# User inputs: 40

# Program outputs:
# "Wow! You are 40 years old. Congratulations!"

# Beast mode challenge:
# Ater the above, the program calculates how many years until
# the user is 100 years old and tells the user. For example, for
# our user input above (Tom and 40), after the program outputs
# "Wow! You are 40 years old. Congratulations!"
# The program also outputs:
# "Tom, in 60 years you will be 100 years old!"
# Our program isn't very nice though, when a user's age is over 100 the program will
# instead output "Tom, you are super old".

# Example 1:

# Program is run and outputs:
# "What is your name?"

# User inputs: "Tom"

# Program outputs:
# "Hi Tom! How old are you?"

# User inputs: 40

# Program outputs:
# "Wow! You are 40 years old. Congratulations!"
# "Tom, in 60 years you will be 100 years old!"

# Example 2:

# Program is run and outputs:
# "What is your name?"

# User inputs: "Tom"

# Program outputs:
# "Hi Tom! How old are you?"

# User inputs: 40

# Program outputs:
# "Wow! You are 40 years old. Congratulations!"
# "Tom, you are super old!"

# Beast mode++ challenge:
# Turn this program into a loop that will repeat these tasks until they type 'stop'

continue = true

name = ""
age = ""

while continue == true
puts "What is your name?"
name = gets.chomp
if name == "stop" then continue = false
else
puts "Hi #{name}! How old are you?"
age = gets.chomp
if age == "stop" then continue = false
else
age = age.to_i
puts "Wow! You are #{age} years old. Congratulations!"
if age < 100
puts "#{name} in #{100 - age} years you will be 100 years old"
else
    puts "#{name} you are super old."
end
end
end
end
