class VerbalTime

  def verbal_time(time)
    hours = time[0..1].to_i
    minutes = round_to_5_min_accuracy( time[-2..-1].to_f )

    if (minutes == 0)
      "It is #{verbal_hours(hours)} o'clock."
    elsif (minutes == 60) # only happens when rounded up from 57, 58 or 59
      "It is #{verbal_hours(hours + 1)} o'clock."
    elsif (minutes <= 30)
      "It is #{verbal_minutes(minutes)} past #{verbal_hours(hours)}."
    elsif (minutes > 30)
      "It is #{verbal_minutes(60 - minutes)} to #{verbal_hours(hours + 1)}."
    end
  end

  private

  def round_to_5_min_accuracy(minutes_exact)
    (minutes_exact / 5).round * 5
  end

  def verbal_hours(number)
    verbals = {
        1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven',
        8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'one'
    }
    verbals[number]
  end

  def verbal_minutes(number)
    verbals = {
        5 => 'five', 10 => 'ten', 15 => 'quarter', 20 => 'twenty', 25 => 'twenty-five', 30 => 'half'
    }
    verbals[number]
  end

end