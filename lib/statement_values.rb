class StatementValues

	def calculate_car_total(rental)
		car_total = rental.car.price * rental.days_rented
		car_total += calculate_offer(rental.days_rented, rental.car)
	end

	def calculate_car_points(rental)
		points_earned -= 10 if amount_owed < 0
		points_earned += 1

		if r.car.style == Car::SUV && r.days_rented > 1
			bonus_points = bonus_points + 1
		end

		points_earned
	end

	private 

	def calculate_offer(days_rented, car)
		return 0 if car.offer.nil? || days_rented <= car.offer.days_for_offer
		days_in_offer = days_rented - car.offer.days_for_offer
		total_after_offer = car.price - car.offer.price_reduction
		days_in_offer * total_after_offer
	end

end