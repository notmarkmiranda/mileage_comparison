module NumberHelper
  def format_distance(number)
    (number.to_f * 100).floor / 100.0
  end
end
