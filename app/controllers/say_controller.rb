class SayController < ApplicationController
  def Hello

    @time=Time.now
    @day = params['day']
    @month = params['month']
    @year = params['year']
    @submitted = params['commit']
    @ye = params['ye']
    @mo = params['mo']
    @da = params['da']
    @checked = params['check'] == "Check"
    @dayr = params['dayr']
    @monthr = params['monthr']
    @yearr = params['yearr']

    n = @time.strftime("%Y").to_i
    @years = []
    while n >= 0
      inner = []
      inner.push "#{n}"
      inner.push n
      @years.push inner
      n = n - 1
    end
=begin
     n = @time.strftime("%Y").to_i + 1000
     @years2 = []
     while n >= 0
       inner = []
       inner.push "#{n}"
       inner.push n
       @years2.push inner
       n = n - 1
     end
=end

    if @submitted == nil
      select = 2016
    else
      select = @yearr.to_i
    end

    n = @time.strftime("%Y").to_i + 1000
    @years2 = ""
    while n >= 0
      if n == select
        @years2 += "<option selected='selected'>#{n}</option>"
      else
        @years2 += "<option>#{n}</option>"
      end
      n = n - 1
    end

    if @checked
      @todayday = @dayr
      @todaymonth = @monthr
      @todayyear = @yearr
    else
      @todayday = @time.strftime("%-d")
      @todaymonth = @time.strftime("%-m")
      @todayyear = @time.strftime("%Y")
    end



    if @todaymonth.to_i < @month.to_i
      @yearsold  = @todayyear.to_i - @year.to_i - 1
      if @todayday.to_i < @day.to_i
        @monthold = 11-(@month.to_i - @todaymonth.to_i)
        @daysold = 31-(@day.to_i - @todayday.to_i)
      else
        @monthold = 12-(@month.to_i - @todaymonth.to_i)
        @daysold = @todayday.to_i - @day.to_i
      end
    end

    if @todaymonth.to_i == @month.to_i
      if @todayday.to_i < @day.to_i
        @yearsold = @todayyear.to_i - @year.to_i - 1
        @monthold = 11-(@month.to_i - @todaymonth.to_i)
        @daysold = 31-(@day.to_i - @todayday.to_i)
      else
        @yearsold = @todayyear.to_i - @year.to_i
        @monthold = 0
        @daysold = @todayday.to_i - @day.to_i
      end
    end

    if @todaymonth.to_i > @month.to_i
      @yearsold = @todayyear.to_i - @year.to_i
      if @todayday.to_i < @day.to_i
        @monthold = (@todaymonth.to_i - @month.to_i)-1
        @daysold = 31-(@day.to_i - @todayday.to_i)
      else
        @monthold = @todaymonth.to_i - @month.to_i
        @daysold = @todayday.to_i - @day.to_i
      end
    end
    if @submitted == nil
      @daysold = nil
      @monthold = nil
      @yearsold = nil

    end
  end

end
