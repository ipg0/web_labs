# frozen_string_literal: true

require 'rails_helper'

DIGITS = ('0'..'9').to_a

describe LuckyNumsController, type: :controller do
  render_views
  def get_response(from, to)
    get :output, params: { from: from, to: to }
    response.body
  end

  def random_lucky
    half = DIGITS.sample(3)
    (half + half.shuffle).join
  end

  it 'should return different values when given different inputs' do
    expect(get_response('0', '9999')).not_to eq(get_response('0', '99999'))
  end
end
