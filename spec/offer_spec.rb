describe Offer do

  it 'creates an offer' do
    days_for_offer = 2
    price_reduction =  10

    offer = Offer.new(days_for_offer, price_reduction)

    expect(offer.days_for_offer).to eq(days_for_offer)
    expect(offer.price_reduction).to eq(price_reduction)
  end

  it 'calculates total from offer values' do
    days_for_offer = 2
    days_rented = 4
    price_reduction = 1
    car = spy(price: 2)

    offer = Offer.new(days_for_offer, price_reduction)

    expect(offer.calculate_offer(days_rented, car)).to eq(2)

  end
end