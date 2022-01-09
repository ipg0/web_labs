# frozen_string_literal: true

# Point class
Point = Struct.new(:x, :y)

def neibr(point, eps = 1e-9)
  (point.y - yield(point.x)).abs < eps
end
