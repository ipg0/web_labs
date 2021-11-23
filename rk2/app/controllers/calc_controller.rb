# frozen_string_literal: true

# main controller
class CalcController < ApplicationController
  def input; end

  def max(arr)
    half = arr.length / 2
    result = (0...half).max { |i| arr[i].to_f / arr[half + i] }
    {
      first: result,
      second: half + result,
      value: arr[result].to_f / arr[half + result]
    }
  end

  def output
    arr = JSON.parse "[#{params['array_input']}]"
    @result = max arr
  rescue StandardError
    respond_to do |format|
      format.html { render html: 'ОШИБКА 400: Введите массив целых чисел через запятую!', status: 400 }
    end
  end
end
