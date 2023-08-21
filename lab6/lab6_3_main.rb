# frozen_string_literal: true

require './lab6_3'

def cosine_function(steps)
  trap(-1.0, 4.0, steps) do |x|
    x + Math.cos(x)
  end
end

def tangent_function(steps)
  func = ->(x) { Math.tan(x + 1) / (x + 1) }
  trap(1.0, 2.0, steps, &func)
end

puts "Cosine function from -1 to 4 with 100 steps #{cosine_function(100.0)}"
puts "Tangent function from 1 to 2 with 100 steps #{tangent_function(100.0)}"
