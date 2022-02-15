# frozen-string-literal: true

require 'rails_helper'

DIGITS = ('0'..'9').to_a

def random_lucky(len)
  half = [0] * (3 - len) + DIGITS.sample(len)
  (half + half.shuffle).join
end

def submit_form(from, to)
  visit root_path
  fill_in 'from', with: from
  fill_in 'to', with: to
  click_button 'Calculate Lucky Numbers!'
  find(:id, 'result-table').text
end

describe 'Lucky Nums calculator', type: :feature do
  it 'doesn\'t allow to input a string', js: true do
    visit root_path
    fill_in 'from', with: 'a string'
    fill_in 'to', with: 'another string'
    expect(find_field('from').value).not_to eq 'a string'
    expect(find_field('to').value).not_to eq 'another string'
  end

  it 'outputs a proper table when submitted 0...9999', js: true do
    results = submit_form(0, 9_999)
    100.times do
      expect(results).to match(random_lucky(1))
    end
  end

  it 'outputs a proper table when submitted 0...99999', js: true do
    results = submit_form(0, 99_999)
    10.times do
      expect(results).to match(random_lucky(2))
    end
  end

  # it 'outputs a proper table when submitted 0...999999', js: true do
  #   results = submit_form(0, 999_999)
  #   100.times do
  #     expect(results).to match(random_lucky(3))
  #   end
  # end
end
