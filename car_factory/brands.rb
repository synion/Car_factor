module Brands
  private
  BRANDS = %i(fiat lancia ford subaru)
  class UnsupportedBrandException < StandardError
  end

  def raise_error_brands(error)
    raise UnsupportedBrandException, "Brand not supported: '#{error.capitalize}'"
  end

  def is_not_supported_brand?(brand)
      raise_error_brands(brand) if (BRANDS & [brand].flatten).empty?
  end

  def raise_excluded_brand
    raise UnsupportedBrandException, "Factory does not have a brand or do not support it"
  end

  def it_have_brand?(brand)
    raise_excluded_brand if (brand == brands && brands.is_a?(Array)) ||
                             ([brands].flatten & [brand].flatten).empty?
  end

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
    args.each do |car,amount|
      amount.times { cars << Car.new(car) }
    end
    cars
  end
end
