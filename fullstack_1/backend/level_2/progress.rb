require 'date'

class Progress
  attr_reader :objective, :start_date, :end_date, :start, :target, :value, :date

  def initialize(objective, value, date)
    @start_date = objective['start_date']
    @end_date = objective['end_date']
    @start = objective['start']
    @target = objective['target']
    @value = value
    @date = date
  end

  def elapsed
    elapsed = duration(start_date,date)
  end

  def totalTime
    totalTime = duration(start_date,end_date)
  end

  def progressDate
    elapsed*1.0/(totalTime.nonzero?)
  end

  def expectedResult
    progressDate/1.0*(target-start)+start
  end

  def excess
    diff = value - expectedResult
    excess= ((diff*100.0)/expectedResult.nonzero?).round
  end

  def duration(a,b)
    duration = (Date.parse(b) - Date.parse(a)).to_i
    raise "End date is before Start Date " if duration <= 0
    duration
  end
end
