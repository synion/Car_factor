require_relative 'car.rb'

class CarFactory
  include Brands
  include Cars
  attr_reader :brands, :full_name

  def initialize(full_name, args = {})
    is_not_supported_brand?(args[:brands])
    @full_name = full_name
    @brands = args[:brands]
  end

  def name
    is_symbol_or_array?
  end

  def make_car(car_name = brands)
    it_have_brand?(car_name)
    Car.new(car_name)
  end

  def make_cars(args)
    is_integer_or_hash?(args)
  end

  private

  def is_symbol_or_array?
    if brands.is_a?(Symbol)
      "#{full_name} (produces #{brands.capitalize})"
    elsif brands.is_a?(Array)
      "#{full_name} (produces #{brands.map(&:capitalize).join(', ')})"
    end
  end

  def brands_collection
    @brands_collection ||= [brands].flatten
  end
end








