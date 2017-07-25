module NumberHelper
  def format_distance(number)
    (number * 100).floor / 100.0
  end
end
