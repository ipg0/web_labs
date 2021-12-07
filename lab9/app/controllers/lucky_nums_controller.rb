# frozen_string_literal: true

# Lucky Nums controller
class LuckyNumsController < ApplicationController
  def input; end

  def last_three(num)
    num / 100 % 10 + num / 10 % 10 + num % 10
  end

  def first_three(num)
    last_three(num / 1000)
  end

  def lucky?(num)
    first_three(num) == last_three(num)
  end

  def lucky_numbers(range)
    range.select { |num| lucky? num }
         .map
         .with_index { |num, index| [index, format('%06d', num), first_three(num)] }
  end

  def view
    from = params['from']
    to = params['to']
    @result = lucky_numbers(from.to_i..to.to_i)
  end
end
