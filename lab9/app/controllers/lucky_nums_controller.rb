class LuckyNumsController < ApplicationController
  def input; end

  def last3(n)
    n / 100 % 10 + n / 10 % 10 + n % 10
  end

  def first3(n)
    last3(n / 1000)
  end

  def lucky_numbers(range)
    range.select { |n| first3(n) == last3(n) }
         .map.with_index { |n, i| [i, format('%06d', n), first3(n)] }
  end

  def view
    @from = params['from']
    @to = params['to']
    @result = lucky_numbers(@from.to_i..@to.to_i)
  end
end
