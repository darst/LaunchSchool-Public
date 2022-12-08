# mortgage_calculator.rb

MONTHS_PER_YEAR = 12

def prompt(message)
  puts("=> #{message}")
end

def integer?(number)
  number.to_i.to_s == number
end

system 'clear' || 'cls' # clears the screen

loop do
  prompt("Welcome to the Mortgage Calculator!\n\n")

  loan_amount = ''
  loop do
    prompt("Enter the loan amount:")
    loan_amount = gets.chomp
    break if integer?(loan_amount) && loan_amount.to_i > 0
    puts("Please input an integer greater than zero.")
  end

  annual_percentage_rate = ''
  loop do
    prompt("Enter the Annual Percentage Rate:")
    prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
    annual_percentage_rate = gets.chomp
    break if annual_percentage_rate.to_f >= 0
    puts("Please enter a number greater than zero.")
  end

  loan_duration_multiplier = ''
  loop do
    prompt("Is the loan duration in months or years? (M or Y)")
    months_or_years = gets.chomp
    if months_or_years.upcase == 'Y'
      loan_duration_multiplier = MONTHS_PER_YEAR
      break
    elsif months_or_years.upcase == 'M'
      loan_duration_multiplier = 1
      break
    else
      prompt("Input M or Y only, let's try this again.")
    end
  end

  loan_duration_number = ''
  loop do
    prompt("Enter the loan duration:")
    loan_duration_number = gets.chomp
    if integer?(loan_duration_number) && loan_duration_number.to_i > 0
      break
    else
      if loan_duration_number.to_i < 0
        prompt("Yes, the ablity to travel back in time would be so nice :)")
      elsif loan_duration_number.to_i == 0
        prompt("Yes, I wish I had the power to freeze time too :)")
      end
      prompt("Looking for a valid duration in months or years.")
    end
  end

  loan_duration = loan_duration_multiplier * loan_duration_number.to_i
  loan_amount = loan_amount.to_i
  monthly_interest_rate = annual_percentage_rate.to_f / MONTHS_PER_YEAR / 100
  if monthly_interest_rate == 0
    monthly_payment = loan_amount.to_f / loan_duration.to_f
  else
    monthly_payment =
      (loan_amount * (monthly_interest_rate /
      (1 - (1 + monthly_interest_rate)**(-loan_duration))))
  end
  prompt format("Your monthly payment is $%.2f", monthly_payment)

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
