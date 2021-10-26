# frozen_string_literal: true

def calculate_expression(xval, yval, zval)
  (1 + Math.cos(yval.to_f - 2)) / ((xval.to_f**4) / 2 + (Math.sin(zval.to_f)**2))
end
