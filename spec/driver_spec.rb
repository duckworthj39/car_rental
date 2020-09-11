require 'car_rental'
require 'pry-nav'

describe Driver2 do

	it 'creates a new instance' do
		driver = Driver2.new('test_name')

		expect(driver).to_not be_nil
		expect(driver.driver_name).to eq('test_name')
	end


	it 'creates a driver with one rental' do
		rental = double
		driver = Driver2.new('test_name', rentals: [rental])
		expect(driver.rentals.count).to eq(1)
	end

	context 'statement price' do
		it 'returns the correct value when rented for 1 day and no offer' do
			car = spy(style: "test_style", price: 30, offers: [])
			rental = spy(car: car, days_rented: 1)
			driver = Driver2.new("test_name", rentals: [rental])
			expect(driver.statement_price(rental)).to eq(30)
			expect(car).to have_recieved(:price)
			expect(rental).to have_recieved(:days)
		end

		it 'returns the correct value when rented for 2 days and no offer' do
			car = spy(style: "test_style", price: 30, offers: [])
			rental = spy(car: car, days_rented: 2)
			driver = Driver2.new("test_name", rentals: [rental])
			expect(driver.statement_price(rental)).to eq(60)
			expect(car).to have_recieved(:price)
			expect(rental).to have_recieved(:days)
		end

		context 'statement price with offer' do
			fit 'returns correct value when rented for 2 days with 2 day offer' do
				offer = spy(days_for_offer: 2, price_reduction: 10)
				car = spy(offers: [offer], price: 30)
				rental = spy(car: car, days_rented: 3)

				driver = Driver2.new('test_name', rentals: [rental])

				expect(offer).to have_recieved(:days_for_offer)
				expect(car).to have_recieved(:price)
				expect(driver.statement_price(rental)).to eq(110)
			end
		end
	end


	xit 'returns a statement for a Driver with one rental' do
		car = spy(style: "test_style", price: 1)
		rental = double(car: car, days_rented: 1)
		driver = Driver2.new("test_name", rentals: [rental])
		expect(driver.statement).to eq("Car rental record for Bill Simpson\nBMW X1,60\nAmount owed is €30\nEarned bonus points: 2")
	end
end