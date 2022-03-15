# Write a method called calculate_tax_payable which takes a single argument called income.

# Use the tax brackets shown below to calculate tax payable on income,
# and then calculate the tax payable as a percentage of the income.
# The results should be returned in a hash containing a key called percentage_of_income
# and a key called tax_payable.

# Tax brackets:
# $0 – $18,200 Nil
# $18,201– $37,000 19c for each $1 over $18,200
# $37,001 - $87,000 $3,572 plus 32.5c for each $1 over $37,000
# $87,001 - $180,000 $19,822 plus 37c for each $1 over $87,000
# $180,001 and over $54,232 plus 45c for every $1 over $180,000
# Example hash output from a call to calculate_tax_payable(180101.00)

# {:percentage_of_income=>30.13722855508853, :tax_payable=>54277.45}

# After correctly returning the right amounts, make a new method called save_to_file which
# takes a single argument which is the hash returned by calculate_tax_payable

# this method is supposed to save to a text file the person's name,
# their percentage_of_income and their tax_payable in an easy to read format.

def tax_calculation(bracket, income, results)
    difference = income - bracket[:base]
    tax = difference * bracket[:rate]
    results[:percentage_of_income] = ((tax / income) * 100).round(1)
    results[:tax_payable] = tax.round(1)
end

def save_to_file(tax)
    puts "Please enter your name"
    name = gets.chomp
    tax.each do |_k, _v|
  File.write("#{name}'s tax.txt",
             "#{name}, your tax payable is #{tax[:tax_payable]} which was #{tax[:percentage_of_income]}% of your income.")
    end
end

def calculate_tax_payable
    puts "Please enter your YTD income"
    income = gets.chomp.to_i

    lower_bracket = { rate: 0.19, base: 18_200 }
    middle_bracket = { rate: 0.325, base: 37_000 }
    upper_middle_bracket = { rate: 0.37, base: 87_000 }
    upper_bracket = { rate: 0.45, base: 54_232 }

    if income >= 18_201 && income <= 37_000
        tax_calculation(lower_bracket, income, answer = {})

    elsif income > 37_000 && income <= 87_000
        tax_calculation(middle_bracket, income, answer = {})

    elsif income > 87_000 && income <= 180_000
        tax_calculation(upper_middle_bracket, income, answer = {})

    elsif income > 180_000
        tax_calculation(upper_bracket, income, answer = {})
    end

    save_to_file(answer)
end

calculate_tax_payable

# tax_brackets = {
#     lower_bracket: [{rate: 0.19, base: 18200}],
#     middle_bracket: [{rate: 0.325, base: 37000}],
#     upper_middle_bracket: [{rate: 0.37, base: 87000}],
#     upper_bracket: [{rate: 0.45, base: 54232}]
# }
