require 'spec_helper'

describe Car do

  context 'car totals' do

    it 'creates an suv with with correct total' do
      car_name = 'test_car'
      car_price = 2
      days_rented = 2
      car = Suv.new(car_name, car_price)

      expect(car.calculate_total(days_rented)).to eq(4)
    end

    it 'creates a saloon with correct total' do
      car_name = 'test_car'
      car_price = 2
      days_rented = 2
      car = Saloon.new(car_name, car_price)

      expect(car.calculate_total(days_rented)).to eq(2)
    end

    it 'creates a hatchback with correct total' do
      car_name = 'test_car'
      car_price = 20
      days_rented = 6
      car = HatchBack.new(car_name, car_price)

      expect(car.calculate_total(days_rented)).to eq(20)
    end

    context 'applies additional cost of over a day limit' do
      it 'creates a saloon with correct total' do
        car_name = 'test_car'
        car_price = 2
        days_rented = 2
        max_days = 1
        additional_cost = 1
        car = Saloon.new(car_name, car_price, max_days: max_days, additional_cost: additional_cost)

        expect(car.calculate_total(days_rented)).to eq(3)
      end

      it 'creates a hatchback with correct total' do
        car_name = 'test_car'
        car_price = 20
        days_rented = 6
        max_days = 3
        additional_cost = 15
        car = HatchBack.new(car_name, car_price, max_days: max_days, additional_cost: additional_cost)

        expect(car.calculate_total(days_rented)).to eq(65)
      end
    end
  end

  context 'car specific bonus points' do

    it 'returns correct points for an Suv' do
      car_name = 'test_car'
      days_rented = 2
      car = Suv.new(car_name, 0)

      expect(car.apply_points(days_rented)).to eq(1)
    end

  end
end