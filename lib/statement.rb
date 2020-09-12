class Statement

  attr_accessor :driver_name, :driver_cars, :driver_total, :driver_points

  def initialize(driver_name, rentals, offers: [])
		@driver_name = fetch_driver_name(driver_name)
		@driver_cars = fetch_cars(rentals, offers)
		@driver_total = fetch_total_owed(driver_cars)
		# @driver_points = driver_points
	end

  def document
		output = driver_name
		driver_cars.each do |car|
			output += car[:title].to_s + "," + car[:total].to_s + "\n"
		end
		output += "Amount owed is €" + "#{driver_total.to_s}" + "\n"
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

	def fetch_driver_name(driver_name)
		"Car rental record for #{driver_name.to_s}\n"
	end

	def fetch_cars(rentals, offers)
		rentals.each_with_object([]) do |rental, cars|
			car_total = rental.car.price * rental.days_rented
			offer_to_apply = offers.select { |offer| offer.car_style == rental.car.style}.first
			car_total += apply_offers(offer_to_apply, rental.days_rented, rental.car)
			cars << { title: rental.car.title, total: car_total }
		end
	end

  def apply_offers(offer, days_rented, car)
		return 0 if offer.nil?
		binding.pry
		offer.calculate_offer(days_rented, car)
	end

	def fetch_total_owed(cars)
		cars.inject(0) do |sum, car|
			sum += car[:total]
		end
	end
end