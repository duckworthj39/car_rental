class Driver2
	attr_accessor :rentals
	attr_reader :driver_name

	def initialize(driver_name, rentals: [])
		@driver_name = driver_name
		@rentals = rentals
	end

	def statement
		rentals.each_with_object({}) do |rental, statement_content|
			statement_content[:amount_owed] += statement_price(rental)
		end
	end

	def statement_price(rental)
		base_price = rental.car.price * rental.days_rented
		
		offer_price = rental.car.offers.inject(0) do |sum, offer|
			next if rental.days_rented <= offer.days_for_offer
			days_in_offer = rental.days_rented - offer.days_for_offer
			total_after_offer = rental.car.price - offer.price_reduction
			sum + (days_in_offer * total_after_offer)
		end

		base_price + offer_price
	end

	private 

	def calculate_offer(rental, offer)

	end
end