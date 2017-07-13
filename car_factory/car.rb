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



