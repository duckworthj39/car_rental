require 'spec_helper'

describe Statement do

  context 'car totals' do
    it 'returns a statement with the correct car totals' do
      car = spy(calculate_total: 50, apply_points: 0)

      rentals = [double(days_rented: 2, car: car)]
      statement = Statement.new('test_name', rentals)

      expect(car).to have_received(:calculate_total).with(2)
      expect(statement.car_details.first[:total]).to eq(50)
    end

    it 'returns a statement with the correct driver total' do
      car = spy(calculate_total: 50, apply_points: 0)

      rentals = [double(days_rented: 2, car: car), double(days_rented: 2, car: car)]
      statement = Statement.new('test_name', rentals)

      expect(car).to have_received(:calculate_total).with(2).twice
      expect(statement.car_details.first[:total]).to eq(50)
      expect(statement.driver_total).to eq(100)
    end
  end

  context 'bonus points totals' do
    it 'returns correct bonus points total' do
      car = spy(calculate_total: 50, apply_points: 0)

      rentals = [double(days_rented: 2, car: car)]
      statement = Statement.new('test_name', rentals)

      expect(car).to have_received(:apply_points).with(2)
      expect(statement.driver_points).to eq(1)
      expect(statement.car_details.first[:total]).to eq(50)
    end

    it 'returns correct bonus points total when statement price total is less than 0' do
      car = spy(calculate_total: -50, apply_points: 0)

      rentals = [double(days_rented: 2, car: car), double(days_rented: 2, car: car)]
      statement = Statement.new('test_name', rentals)

      expect(car).to have_received(:apply_points).with(2).twice
      expect(statement.driver_points).to eq(-18)
      expect(statement.driver_total).to eq(-100)
    end
  end
end