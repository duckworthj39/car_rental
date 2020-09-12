require 'spec_helper'
require 'pry-nav'

describe StatementValues do
	context 'statement_values amount owed' do
		it 'returns the correct value when rented for 1 day and no offer' do
			car = spy(style: "test_style", price: 30, offer: nil)
			rental = spy(car: car, days_rented: 1)

			statement_values = StatementValues.new

			expect(statement_values.calculate_car_total(rental)).to eq(30)
			expect(car).to have_recieved(:price)
			expect(rental).to have_recieved(:days)
		end

		it 'returns the correct value when rented for 2 days and no offer' do
			car = spy(style: "test_style", price: 30, offer: nil)
			rental = spy(car: car, days_rented: 2)

			statement_values = StatementValues.new

			expect(statement_values.calculate_car_total(rental)).to eq(60)
			expect(car).to have_recieved(:price)
			expect(rental).to have_recieved(:days)
		end

		xit 'returns the correct value when two rentals rented for two days' do
			car = spy(style: "test_style", price: 30, offer: nil)
			rental = spy(car: car, days_rented: 2)
			rental2 = spy(car: car, days_rented: 2)
			statement_values = StatementValues.new
			statement_values.calculate_car_total(rental)
			statement_values.calculate_car_total(rental2)

			expect(statement_values.amount_owed).to eq(120)
			expect(car).to have_recieved(:price)
			expect(rental).to have_recieved(:days)
		end

		context 'price with offer' do
			it 'returns correct value when rented for 2 days with 2 day offer' do
				offer = spy(days_for_offer: 2, price_reduction: 10)
				car = spy(offer: offer, price: 30)
				rental = spy(car: car, days_rented: 3)

				statement_values = StatementValues.new
				

				expect(offer).to have_recieved(:days_for_offer)
				expect(car).to have_recieved(:price)
				expect(statement_values.calculate_car_total(rental)).to eq(110)
			end
		end
	end


	context 'statement_values points' do
		it 'return correct amount of points from point rule' do
			points_rule
			car = spy(offer: offer, price: 30)
			rental = spy(car: car, days_rented: 3)

			statement_values = StatementValues.new
			statement_values.calculate_car_total(rental)

			expect(offer).to have_recieved(:days_for_offer)
			expect(car).to have_recieved(:price)
			expect(statement_values.amount_owed).to eq(110)
		end
	end
end