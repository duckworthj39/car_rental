class Car

  POINTS_VALUE = 1
  attr_reader :title, :base_price, :max_days, :additional_cost

  def initialize(title, base_price, max_days: 0, additional_cost: 0)
    @title = title
    @base_price = base_price
    @max_days = max_days
    @additional_cost = additional_cost
  end

  # A car has a base price unless it is above a certain amount of days
  def calculate_total(days_rented)
    total = base_price
    return total unless days_rented > max_days
    total + (days_rented - max_days) * additional_cost
  end

  # Don't apply any points if sublass has no method implemented
  def apply_points(days_rented)
    0
  end

end