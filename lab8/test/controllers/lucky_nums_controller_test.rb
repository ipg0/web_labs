require 'test_helper'

CHARS = ('0'..'9').to_a

class LuckyNumsControllerTest < ActionDispatch::IntegrationTest
  test 'should get input containing form' do
    get '/'
    assert_response :success
    assert_match 'form', response.body
  end

  def generate_random_lucky
    half = CHARS.sample(3)
    (half + half.shuffle).join
  end

  test 'should get view containing a table with proper numbers' do
    get '/lucky_nums/view'
    assert_response :success
    assert_match 'table', response.body
    200.times do
      current = generate_random_lucky
      assert_match current, response.body
    end
  end
end
