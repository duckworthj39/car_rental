require 'spec_helper'

describe Driver do

	it 'creates a new instance' do
		driver = Driver.new('test_name')

		expect(driver).to_not be_nil
		expect(driver.driver_name).to eq('test_name')
	end

	it 'creates a driver with one rental' do
		rental = double
		driver = Driver.new('test_name', rentals: [rental])
		expect(driver.rentals.count).to eq(1)
	end


	fit 'returns a statement for a Driver with one rental' do
		car = spy(title: "BMW X1", style: "test_style", price: 1)
		rental = double(car: car, days_rented: 1)
		statement_values = spy(calculate_car_total: 1, calculate_car_points: 1)

		driver = Driver.new("test_name", rentals: [rental])

		statement_output = driver.fetch_statement(statement_values: statement_values)
		expect(statement_output).to eq("Car rental record for test_name\nBMW X1,1\nAmount owed is €1\nEarned bonus points: 1")
	end
end