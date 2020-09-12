require 'spec_helper'
require 'pry-nav'

RSpec.describe 'CarRental' do
	context 'challenge spec' do
    it 'outputs challenge statement' do
			# Arrange
			saloon1 = Saloon.new('Audi A3', 20, max_days: 2, additional_cost: 15)
			suv1 = Suv.new('BMW X1', 30)

			driver = Driver.new('Bill Simpson')
			driver.add_rental(Rental.new(suv1, 2))  # rent this SUV for 2 days
			driver.add_rental(Rental.new(saloon1, 2))
			# Act
			statement = driver.fetch_statement
			# Assert
			expect(statement).to eq("Car rental record for Bill Simpson\nBMW X1,60\nAudi A3,20\nAmount owed is €80\nEarned bonus points: 3")
    end

    it 'outputs challenge statement as json' do
			saloon1 = Saloon.new('Audi A3', 20, max_days: 2, additional_cost: 15)
			suv1 = Suv.new('BMW X1', 30)

			driver = Driver.new('Bill Simpson')
			driver.add_rental(Rental.new(suv1, 2))  # rent this SUV for 2 days
			driver.add_rental(Rental.new(saloon1, 2))
			# Act
			statement = driver.fetch_json_statement
      expect(statement).to eq("{\"driver_name\":\"Bill Simpson\",\"cars\":[{\"title\":\"BMW X1\",\"total\":60},{\"title\":\"Audi A3\",\"total\":20}],\"amount_owed\":80,\"driver_points\":3}")
		end
	end
end