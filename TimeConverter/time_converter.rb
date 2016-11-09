
class TimeConverter

  def self.to_24h(time_12h)
    hours_and_minutes = time_12h[0..-3].split(':')
    hours = hours_and_minutes[0]
    minutes = hours_and_minutes[1]

    am_or_pm = time_12h[-2..-1].upcase

    if am_or_pm == 'PM'
      hours = hours.to_i + 12 unless noon?(am_or_pm, hours)
    elsif midnight?(am_or_pm, hours)
      hours = '00'
    end

    "#{hours}:#{minutes}"
  end

  def self.noon?(am_or_pm, hours)
    am_or_pm == 'PM' && hours == '12'
  end

  def self.midnight?(am_or_pm, hours)
    am_or_pm == 'AM' && hours == '12'
  end

end