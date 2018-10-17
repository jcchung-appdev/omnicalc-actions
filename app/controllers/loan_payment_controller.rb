class LoanPaymentController < ApplicationController
  def loan_payment
    @apr = params.fetch("annual_percentage_rate").to_f
    @years = params.fetch("number_of_years").to_i
    @principal = params.fetch("principal_value").to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    apr = @apr / 100 / 12
    @monthly_payment = (apr * @principal) / (1-(1+apr)**(-1*@years*12))

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment_templates/loan_payment.html.erb")
  end

  def loan_payment_form
    render("loan_payment_templates/loan_payment_form.html.erb")
  end
end
