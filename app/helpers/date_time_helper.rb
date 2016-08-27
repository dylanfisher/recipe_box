module DateTimeHelper

  def full_date(date)
    date.strftime('%B %d, %Y')
  end

  def rounded_time(seconds = 900)
    Time.at((Time.zone.now.to_f / seconds).round * seconds)
  end

end
