require 'spec_helper'
require 'pry-nav'

RSpec.describe 'CarRental' do
	context 'challenge spec' do
    fit 'outputs correct statement' do
			# Arrange


      hatchback_offer = Offer.new(Car::HATCHBACK, 3, 0)
      saloon_offer = Offer.new(Car::SALOON, 2, 5)
      offers = [hatchback_offer, saloon_offer]
			saloon1 = Car.new('Audi A3', Car::SALOON, 20)
			suv1 = Car.new('BMW X1', Car::SUV, 30)

			driver = Driver.new('Bill Simpson')
			driver.add_rental(Rental.new(suv1, 2))  # rent this SUV for 2 days
			driver.add_rental(Rental.new(saloon1, 2))
			# Act
			statement = driver.fetch_statement(offers)
			# Assert
			expect(statement).to eq("Car rental record for Bill Simpson\nBMW X1,60\nAudi A3,20\nAmount owed is €80\nEarned bonus points: 3")
		end
	end
end