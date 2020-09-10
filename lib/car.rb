class Car

	attr_reader :car_name, :car_price, :days_for_offer

	def initialize(car_name, car_price, days_for_offer)
		@car_name = car_name
		@car_price = car_price
		@days_for_offer = days_for_offer
	end
	
end