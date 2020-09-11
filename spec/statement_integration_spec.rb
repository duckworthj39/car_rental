require 'car_rental'
require 'pry-nav'

RSpec.describe 'CarRental' do

	context 'challenge spec' do
		fit 'outputs correct statement' do
			# Arrange
			saloon1 = Car.new('Audi A3', Car::SALOON)
			suv1 = Car.new('BMW X1', Car::SUV)
			driver = Driver.new('Bill Simpson')
			driver.add_rental(Rental.new(suv1, 2))  # rent this SUV for 2 days
			driver.add_rental(Rental.new(saloon1, 2))
			# Act
			statement = driver.statement
			# Assert
			expect(statement).to eq("Car rental record for Bill Simpson\nBMW X1,60\nAudi A3,20\nAmount owed is €80\nEarned bonus points: 3")
		end
	end
end