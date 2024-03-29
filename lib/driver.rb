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

	def fetch_statement(statement_klass: Statement)
		statement = statement_klass.new(driver_name, rentals)
		statement.to_s
	end

  def fetch_json_statement(statement_klass: Statement)
		statement = statement_klass.new(driver_name, rentals)
		statement.as_json
	end
end