class LuckyNumsController < ApplicationController
  def input; end

  def first3(n)
    n / 100_000 + n / 10_000 % 10 + n / 1_000 % 10
  end

  def last3(n)
    n / 100 % 10 + n / 10 % 10 + n % 10
  end

  def lucky_numbers(range)
    range.select { |n| first3(n) == last3(n) }
         .map.with_index { |n, i| [i + 1, format('%06d', n), first3(n)] }
  end

  def view
    from = params['from'] || 0
    to = params['to'] || 999_999
    params.each do |key, value|
      Rails.logger.warn "Param #{key}: #{value}"
    end
    @rows = lucky_numbers(from.to_i..to.to_i)
  end
end
