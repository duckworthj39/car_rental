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

	def fetch_statement(offers, statement_klass: Statement)
		statement = statement_klass.new(driver_name, rentals, offers: offers)
		statement.document
	end
end