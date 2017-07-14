class CarPark
  attr_accessor :capacity

  def initialize(capacity,cars = [])
    @capacity = capacity
  end

  def places_left
    capacity - cars.size
  end

  def cars
    @cars ||= []
  end

  def brands
    cars.map { |car| car.brand }.uniq
  end

  def brands_stats
    cars.inject(Hash.new(0)) { |stats,car| stats[car.brand] += 1; stats }
  end

  def receive(*args)
    number = args.flatten.size
    number > capacity ? number = capacity : number
    number.times { |car| cars << args.flatten[car] }
  end

  def retrieve(number)
    cars.pop(number)
  end
end

