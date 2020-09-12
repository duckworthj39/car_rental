class Offer

  attr_reader :car_style, :days_for_offer, :price_reduction
  def initialize(car_style, days_for_offer, price_reduction)
    @car_style = car_style
    @days_for_offer = days_for_offer
    @price_reduction = price_reduction
  end

  def calculate_offer(days_rented, car)
    return 0 unless days_rented > @days_for_offer
    days_in_offer = days_rented - @days_for_offer
    total_after_offer = car.price - @price_reduction
    days_in_offer * total_after_offer
  end
end