class Car
  SALOON = 0
  SUV = 1
  HATCHBACK = 2

  attr_reader :title, :price, :offer
  attr_accessor :style

  def initialize(title, style, price, offer: nil)
    @title = title
		@style = style
		@price = price
		@offer = nil
  end
end