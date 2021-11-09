# frozen_string_literal: true

require './lab7_2'

def init_ui
  puts "House:\n#{House.new(2010, 3200, 640_000_000)}"
  puts ''
  puts "Extended House:\n#{ExtendedHouse.new(2010, 3200, 640_000_000)}"
end

init_ui
