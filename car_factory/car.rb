class Car
  AVAILABLE_COLORS = %i(yellow black red)
  attr_accessor :color
  attr_writer :brand

  def initialize(brand,option = {})
    @brand  = brand
    @color = option[:color] || set_default
  end

  def color_name
    color.to_s.split('_').map(&:capitalize).join(' ')
  end

  def brand
    @brand.to_s.capitalize
  end

  private
  def set_default
    @color = AVAILABLE_COLORS.first
    AVAILABLE_COLORS.rotate!
    @color
  end
end

module Cars
  def is_integer_or_hash?(args)
    if args.is_a?(Integer)
      number_cars_by_number(args)
    elsif args.is_a?(Hash)
      number_cars_by_hash(args)
    end
  end

  def number_cars_by_number(args,cars =[])
    args.times do
      cars << Car.new(brands_collection.first)
      brands_collection.rotate!
    end
    cars
  end

  def number_cars_by_hash(args,cars =[])
    args.keep_if { |car,amount| brands.include?(car) }
    args.each do |car,amount|
      amount.times { cars << Car.new(car) }
    end
    cars
  end
end
