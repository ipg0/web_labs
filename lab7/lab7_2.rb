# frozen_string_literal: true

# House class
class House
  attr_reader :year_of_build, :total_area, :total_cost

  def initialize(year_of_build, total_area, total_cost)
    @year_of_build = year_of_build
    @total_area = total_area
    @total_cost = total_cost
  end

  def to_s
    "Year of build: #{year_of_build}\nTotal area: #{total_area}\nTotal cost: #{total_cost}"
  end
end

# House with Cost Per Meter
class ExtendedHouse < House
  attr_reader :cost_per_square_meter

  public :year_of_build, :total_area, :total_cost

  def initialize(year_of_build, total_area, total_cost)
    super
    @cost_per_square_meter = total_cost / total_area
  end

  def to_s
    "#{super}\nCost per square meter: #{cost_per_square_meter}"
  end
end
