require_relative 'car_factory/car'

car = Car.new(:fiat)
car2 = Car.new(:fiat)
car3 = Car.new(:fiat)
puts car.color_name
puts car3.color_name
