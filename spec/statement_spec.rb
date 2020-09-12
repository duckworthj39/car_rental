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
	# context 'statement_values amount owed' do
  #   it 'returns the correct value when rented for 1 day and no offer' do
	# 		car = spy(title: 'test_title', style: "test_style", price: 30, offer: nil)
	# 		rental = spy(car: car, days_rented: 1)
	#
	# 		statement = Statement.new("test_name", [rental])
	#
	# 		expect(statement.driver_total).to eq(30)
	# 		expect(car).to have_recieved(:price)
	# 		expect(rental).to have_recieved(:days)
	# 	end
	#
	# 	it 'returns the correct value when rented for 2 days and no offer' do
	# 		car = spy(title: 'test_title', style: "test_style", price: 30, offer: nil)
	# 		rental = spy(car: car, days_rented: 2)
	#
	# 		statement = Statement.new("test_name", [rental])
	#
	# 		expect(statement.driver_total).to eq(60)
	# 		expect(car).to have_recieved(:price)
	# 		expect(rental).to have_recieved(:days)
	# 	end
	#
	# 	xit 'returns the correct value when two rentals rented for two days' do
	# 		car = spy(title: 'test_title', style: "test_style", price: 30, offer: nil)
	# 		rental = spy(car: car, days_rented: 2)
	# 		rental2 = spy(car: car, days_rented: 2)
	#
	# 		statement = Statement.new("test_name", [rental])
	#
	# 		expect(statement.driver_total).to eq(120)
	# 		expect(car).to have_recieved(:price)
	# 		expect(rental).to have_recieved(:days)
	# 	end
	#
	# 	context 'price with offer' do
	# 		it 'returns correct value when rented for 2 days with 2 day offer' do
	# 			offer = spy(days_for_offer: 2, price_reduction: 10)
	# 			car = spy(title: 'test_title', offer: offer, price: 30)
	# 			rental = spy(car: car, days_rented: 3)
	#
	# 			statement = Statement.new("test_name", [rental])
	#
	# 			expect(offer).to have_recieved(:days_for_offer)
	# 			expect(car).to have_recieved(:price)
	# 			expect(statement.driver_total).to eq(110)
	# 		end
	# 	end
	# end


	# context 'statement_values points' do
	# 	it 'return correct amount of points from point rule' do
	# 		points_rule
	# 		car = spy(offer: offer, price: 30)
	# 		rental = spy(car: car, days_rented: 3)
	#
	# 		statement = Statement.new("test_name", [rental])
	#
	# 		expect(offer).to have_recieved(:days_for_offer)
	# 		expect(car).to have_recieved(:price)
	# 		expect(statement.driver_total).to eq(110)
	# 	end
	# end
end