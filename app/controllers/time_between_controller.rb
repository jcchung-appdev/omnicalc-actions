class TimeBetweenController < ApplicationController
  def time_between
    @starting = Chronic.parse(params.fetch("starting_time"))
    @ending = Chronic.parse(params.fetch("ending_time"))

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================
    diff = @starting - @ending
    @seconds = diff
    @minutes = diff / 60
    @hours = diff / 60 / 60
    @days = diff / 60 / 60 / 24
    @weeks = diff / 60 / 60 / 24 / 7
    @years = diff / 60 / 60 / 24 / 365

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between_templates/time_between.html.erb")
  end

  def time_between_form
    render("time_between_templates/time_between_form.html.erb")
  end
end
