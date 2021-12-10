# frozen-string-literal: true

require 'rails_helper'

DIGITS = ('0'..'9').to_a

def submit_form(from, to)
  visit '/'
  fill_in 'From', with: from
  fill_in 'To', with: to
  click_on 'Calculate Lucky Numbers!'
  page
end

def submit_form_xml(from, to)
  visit '/'
  fill_in 'From', with: from
  fill_in 'To', with: to
  choose 'Client-side (in browser)'
  click_on 'Calculate Lucky Numbers!'
  page
end

def random_lucky
  half = DIGITS.sample(3)
  (half + half.shuffle).join
end

describe 'XML Processor', type: :feature do
  it 'responds with different data when given different inputs' do
    expect(submit_form('0', '9999').body).not_to eq(submit_form('0', '99999').body)
  end

  it 'responds with XML when client-side XSLT is selected' do
    expect(submit_form_xml('0', '9999').source).not_to include('<html>')
  end

  it 'responds with HTML when server-side XSLT is selected' do
    expect(submit_form('0', '9999').source).to include('<html>')
  end

  it 'doesn\'t allow to input a string', js: true do
    visit '/'
    fill_in 'from', with: 'a string'
    fill_in 'to', with: 'another string'
    expect(find_field('from').value).not_to eq 'a string'
    expect(find_field('to').value).not_to eq 'another string'
  end

  it 'outputs a proper table when submitted 0...999999', js: true do
    results = submit_form(0, 999_999).body
    100.times do
      expect(results).to match(random_lucky)
    end
  end
end
