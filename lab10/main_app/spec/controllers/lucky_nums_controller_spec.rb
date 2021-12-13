# frozen_string_literal: true

require 'rails_helper'

DIGITS = ('0'..'9').to_a

describe LuckyNumsController, type: :controller do
  def get_xml(from, to)
    get :view, params: { from: from, to: to, format: :xml }
    response
  end

  def random_lucky
    half = DIGITS.sample(3)
    (half + half.shuffle).join
  end

  it 'should respond with RSS' do
    get :view, params: { from: '0', to: '9999', format: :rss }
    expect(response.content_type).to include('xml')
  end

  it 'should return different values when given different inputs' do
    expect(get_xml('0', '9999')).not_to eq(get_xml('0', '99999'))
  end

  it 'outputs a proper table when submitted 0...999999' do
    results = get_xml('0', '999999').body
    100.times do
      expect(results).to include(random_lucky)
    end
  end
end
