class CarFactory
	def self.fetch_car(car_type, car_name, car_price, days_for_offer, object: Object)
		begin
			car_type_const = object.get_const(car_type)
			car_type_const.new(car_name, car_price, days_for_offer)
		rescue Exception => e
			puts "failed to create #{car_type}"
			raise e.message
		end
	end
end
