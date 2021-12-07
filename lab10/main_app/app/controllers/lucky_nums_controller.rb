# frozen_string_literal: true

MSG_NOT_ACCEPTABLE = '406: Not Acceptable: This page is only available in XML format'

# Lucky Nums controller
class LuckyNumsController < ApplicationController
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
         .with_index do |num, index|
      {
        'index' => index,
        'number' => format('%06d', num),
        'sum' => first_three(num)
      }
    end
  end

  def view
    from = params['from'] || 0
    to = params['to'] || 999_999
    result = lucky_numbers(from.to_i..to.to_i)
    respond_to do |format|
      format.xml { render xml: result }
      format.rss { render xml: result }
      format.all do
        render html: MSG_NOT_ACCEPTABLE, status: :not_acceptable
      end
    end
  end
end
