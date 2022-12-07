# mortgage_calculator.rb

def prompt(message)
  puts("=> #{message}")
end

def integer(number)
  number.to_i.to_s == number
end

def float(number)
  number.to_f.to_s == number
end

loop do
  prompt("Welcome to the Mortgage Calculator!\n\n")

  loan_amount = ''
  loop do
    prompt("Enter the loan amount:")
    loan_amount = gets.chomp
    break if integer(loan_amount) && loan_amount.to_i > 0
    puts("Please input an integer greater than zero.")
  end

  annual_percentage_rate = ''
  loop do
    prompt("Enter the Annual Percentage Rate:")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    annual_percentage_rate = gets.chomp
    break if annual_percentage_rate.to_f > 0
    puts("Please enter a number greater than zero.")
  end

  loan_duration = ''
  loan_duration_in_months = ''
  loop do
    prompt("Enter the loan duration:")
    loan_duration = gets.chomp
    loop do
      prompt("Did you enter the duration in months or years? (M or Y)")
      months_or_years = gets.chomp
      if months_or_years.upcase == 'Y'
        loan_duration_in_months = loan_duration.to_i * 12
        break
      elsif months_or_years.upcase == 'M'
        loan_duration_in_months = loan_duration.to_i
        break
      else
        prompt("Input M or Y only, let's try this again.")
      end
    end
    if integer(loan_duration)
      break
    else
      prompt("Enter a valid duration in months or years.")
    end
  end

  loan_amount = loan_amount.to_i
  monthly_interest_rate = annual_percentage_rate.to_f / 12 / 100
  monthly_payment =
    (loan_amount * (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))).round(2)
  prompt("Your monthly payment is $#{monthly_payment} per month!")

  run_again = ''
  loop do
    prompt("Do you want me to run another calculation?")
    run_again = gets.chomp
    if run_again.upcase == 'Y' || run_again.upcase == "YES" ||
       run_again.upcase == 'N' || run_again.upcase == 'NO'
      break
    else
      prompt("It's a 'yes' or 'no' question!")
    end
  end

  break if run_again.upcase == 'N' || run_again.upcase == 'NO'
end

prompt("Bye, then!")
