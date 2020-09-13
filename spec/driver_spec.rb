require 'spec_helper'

describe Driver do

  it 'creates a new instance' do
    driver = Driver.new('test_name')

    expect(driver).to_not be_nil
    expect(driver.driver_name).to eq('test_name')
  end

  context 'adding rentals' do

    let(:rental) { double }

    it 'creates a driver with one rental' do
      driver = Driver.new('test_name', rentals: [rental])
      expect(driver.rentals.count).to eq(1)
    end

    it 'adds a rental' do
      driver = Driver.new('test_name')

      driver.add_rental(rental)

      expect(driver.rentals.count).to eq(1)
    end
  end


  context 'driver statements' do
		it 'returns a statement for a Driver with one rental' do
			test_statement = 'test statement'

			statement_instance = spy(
					to_s: test_statement
			)

			statement = double(new: statement_instance)
			driver = Driver.new("test_name")

			statement_output = driver.fetch_statement(statement_klass: statement)

			expect(statement_output).to eq(test_statement)
			expect(statement_instance).to have_received(:to_s)
    end

		it 'returns a statement for a Driver with one rental in json format' do
			test_statement = 'test statement'

			statement_instance = spy(
          as_json: test_statement
			)

			statement = double(new: statement_instance)
			driver = Driver.new("test_name")

			statement_output = driver.fetch_json_statement(statement_klass: statement)

			expect(statement_output).to eq(test_statement)
			expect(statement_instance).to have_received(:as_json)
		end
	end
end