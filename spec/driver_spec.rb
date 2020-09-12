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


  it 'returns a statement for a Driver with one rental' do
		statement = spy(
        document: "Car rental record for test_name\nBMW X1,1\nAmount owed is €1\nEarned bonus points: 1"
    )

		driver = Driver.new("test_name")

		statement_output = driver.fetch_statement(statement: statement)

		expect(statement_output).to eq("Car rental record for test_name\nBMW X1,1\nAmount owed is €1\nEarned bonus points: 1")
	end
end