class Driver
	attr_accessor :rentals
	attr_reader :driver_name

	def initialize(driver_name, rentals: [])
		@driver_name = driver_name
		@rentals = rentals
	end

	def add_rental(rental)
    @rentals << rental
  end

	def fetch_statement(statement_values: StatementValues.new)
		output = "Car rental record for #{@driver_name.to_s}\n"

		totals = rentals.inject({total: 0, total_points: 0}) do |hash, rental|
			car_total = statement_values.calculate_car_total(rental)
			output += rental.car.title.to_s + "," + car_total.to_s + "\n"

			hash[:total] += car_total
			hash[:total_points] += statement_values.calculate_car_points(rental)
			hash
		end

		output += "Amount owed is €" + "#{totals[:total].to_s}" + "\n"
		output += "Earned bonus points: " + totals[:total_points].to_s
		output
	end
end