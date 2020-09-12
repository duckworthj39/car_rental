class Suv < Car

  def calculate_total(days_rented)
    price * days_rented
  end

  def apply_points(days_rented, points: 0)
    points += @points_bonus if days_rented > @points_day_limit
  end
end