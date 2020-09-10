require 'spec_helper'
require 'pry-nav'

describe CarFactory do
	it 'creates a type of car' do
		car_spy = spy(new: "test_car")
		object_spy = spy(get_const: car_spy)

		car = CarFactory.fetch_car("test", "test_name", 1.00, 2, object: object_spy)

		expect(object_spy).to have_recieved(:get_const)
		expect(car_spy).to have_recieved(:new)
		expect(car).to eq("test_car")
	end

	it 'creates an SUV' do
		car = CarFactory.fetch_car("suv", "BMW X1", 30, 0)

		expect(car).to be_a(Suv)
	end
end