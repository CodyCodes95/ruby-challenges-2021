# Welcome to the first of the Git Ruby Challenges. Updated on the daily.

# Smaller and less intense than the Canvas challenges, these are designed to introduce a ruby methods and get you familiar with searching for a solution

# First Challenge is to take my string and convert every "s" character to a "th" and output that to the console.

# For example,
my_string = "I was stranded in the Mississippi River"

# Would output

expected = "I wath thtranded in the Miththiththippi River"

# Once you are able to output the correct output when running your code, try finding a way to get input from a user when they run your code.
# Then convert that input to a new "th" replaced string

def lisp_converter(str)
    new_str = ""
    str.each_char do |c|
    new_str += if c == "s"
        "th"
               else
        c
               end
    end
    return new_str
end

answer = lisp_converter(my_string)
p answer
p answer == expected
