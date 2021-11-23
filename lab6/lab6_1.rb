# frozen_string_literal: true

def expr(index)
  ((-1)**(index.to_f - 1)) / index
end

def calculate_series(eps)
  sum = 0
  index = 0
  next_element = 1
  sum += (next_element = expr(index += 1)) while next_element.abs > eps
  sum
end
