require 'spec_helper'
require 'pry-nav'

describe Statement do

  it 'returns a statement with the correct car totals' do
		car = spy(calculate_total: 50, apply_points: 0)

    rentals = [spy(days_rented: 2, car: car)]
    statement = Statement.new('test_name', rentals)

    expect(car).to have_received(:calculate_total).with(2)
    expect(statement.driver_cars.first[:total]).to eq(50)
  end

  it 'returns a statement with the correct driver total' do
    car = spy(calculate_total: 50, apply_points: 0)

    rentals = [spy(days_rented: 2, car: car), spy(days_rented: 2, car: car)]
    statement = Statement.new('test_name', rentals)

    expect(car).to have_received(:calculate_total).with(2).twice
    expect(statement.driver_cars.first[:total]).to eq(50)
    expect(statement.driver_total).to eq(100)
  end
end