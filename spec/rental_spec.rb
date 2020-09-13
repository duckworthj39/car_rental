require 'spec_helper'

describe Rental do

  it 'creates a rental' do
    days_rented = 2
    car = double

    rental = Rental.new(car, days_rented)

    expect(rental.car).to eq(car)
    expect(rental.days_rented).to eq(days_rented)
  end

  it 'raises an exception if days_rented is less than 0' do
    days_rented = -2
    car = double

    expect{Rental.new(car, days_rented)}.to raise_error(RuntimeError)
  end
end