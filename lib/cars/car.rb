class Car

  POINTS_VALUE = 1
  attr_reader :title, :price, :max_days, :additional_cost, :points_day_limit, :point_bonus

  def initialize(title, price, max_days: 0, additional_cost: 0, points_day_limit: 0, points_bonus: 1)
    @title = title
    @price = price
    @max_days = max_days
    @additional_cost = additional_cost
    @points_day_limit = points_day_limit
    @points_bonus = points_bonus
  end

  def calculate_total(days_rented)
    total = price
    return total unless days_rented > max_days
    total + (days_rented - max_days) * additional_cost
  end

  def apply_points(days_rented, points: 0)
    points
  end

end