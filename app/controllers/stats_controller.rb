class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort 

    @count = @numbers.length

    @minimum = @numbers.sort[0]

    @maximum = @numbers.sort[@numbers.length-1]

    @range = @maximum - @minimum

    # Median
    # ======

    if @count % 2 == 0
      median = (@sorted_numbers[@count/2]+@sorted_numbers[@count/2-1])/2
    else
      median = @sorted_numbers[(@count/2)+0.5]
    end

    @median = median

    sum = 0
    
    @numbers.each do |i|
      sum += i
    end

    @sum = sum

    @mean = sum / @count

    # Variance
    # ========
    sq_diffs = []
    @numbers.each do |i|
      sq_diffs.push((i-@mean)**2)
    end
    
    sum_sq_diffs = 0
    sq_diffs.each do |i|
      sum_sq_diffs += i
    end
    
    @variance = sum_sq_diffs / sq_diffs.length

    @standard_deviation = Math.sqrt(@variance)

    # Mode
    # ====
    
    mode = 0
    cnt = 0
    max = -1
    cur_num = 0
    @sorted_numbers.each do |num|
      if cur_num == num
        cnt += 1
      else
        if cnt > max
          max = cnt
          mode = cur_num
        end
        cur_num = num
        cnt = 0
      end
    end

    @mode = mode

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
