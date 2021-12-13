# frozen-string-literal: true

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
         .map.with_index { |num, i| [i + 1, format('%06d', num), first_three(num)] }
  end

  def output
    @from = params['from'].to_i || 0
    @to = params['to'].to_i || 999_999
    if (cached = LuckyNumsResult.find_by(from: @from, to: @to))
      @rows = JSON.parse cached.result
    else
      @rows = lucky_numbers(@from..@to)
      LuckyNumsResult.create from: @from, to: @to, result: @rows.to_json
    end
  end
end
