# frozen_string_literal: true

require './lab7_2'

test_plank = Plank.new(10, 20)

puts "Area: #{test_plank.area}"

test_box = Case.new(10, 20, 30)

test_box.print_props

puts "Volume: #{test_box.volume}"
