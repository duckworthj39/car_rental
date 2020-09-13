class Statement

  POINTS_REDUCTION = 10
  POINTS_PER_RENTAL = 1
  POINTS_REDUCTION_THRESHOLD = 0

  attr_accessor :driver_name, :car_details, :driver_total, :driver_points

  def initialize(driver_name, rentals)
		@driver_name = driver_name
		@car_details = fetch_car_details(rentals)
		@driver_total = fetch_total_owed(car_details)
		@driver_points = calculate_car_points(rentals, driver_total)
	end

  def to_s
		output = "Car rental record for #{driver_name.to_s}\n"
		car_details.each do |car|
			output += car[:title].to_s + "," + car[:total].to_s + "\n"
		end
		output += "Amount owed is €" + "#{driver_total.to_s}" + "\n"
		output + "Earned bonus points: " + driver_points.to_s
	end

  def as_json
		{}.tap do |hash|
			hash[:driver_name] = driver_name
			hash[:cars] = car_details
			hash[:amount_owed] = driver_total
			hash[:driver_points] = driver_points
		end.to_json
	end

	private

	def fetch_car_details(rentals)
		rentals.each_with_object([]) do |rental, cars|
			cars << { title: rental.car.title, total: rental.car.calculate_total(rental.days_rented) }
		end
	end

	def fetch_total_owed(cars)
		cars.inject(0) do |sum, car|
			sum += car[:total]
		end
	end

	def calculate_car_points(rentals, amount_owed)
		rentals.inject(0) do |sum, rental|
			sum -= POINTS_REDUCTION if amount_owed < POINTS_REDUCTION_THRESHOLD
			sum += POINTS_PER_RENTAL
			sum + rental.car.apply_points(rental.days_rented)
		end
	end
end