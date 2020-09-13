class Suv < Car

  POINTS_DAY_CRITERIA = 1

  def calculate_total(days_rented)
    base_price * days_rented
  end

  def apply_points(days_rented, points: 0)
    points + POINTS_VALUE if days_rented > POINTS_DAY_CRITERIA
  end
end