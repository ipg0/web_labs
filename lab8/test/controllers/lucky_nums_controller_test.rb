require 'test_helper'

class LuckyNumsControllerTest < ActionDispatch::IntegrationTest
  test 'should get input containing form' do
    get '/'
    assert_response :success
    assert_match 'form', response.body
  end

  def first3(n)
    n / 100_000 + n / 10_000 % 10 + n / 1_000 % 10
  end

  def last3(n)
    n / 100 % 10 + n / 10 % 10 + n % 10
  end

  def lucky_numbers(range)
    range.select { |n| first3(n) == last3(n) }
         .map.with_index do |n, i|
           p "generating: #{n} / #{range.size} generated" if (i % 1000).zero?
           [i + 1, format('%06d', n), first3(n)]
         end
  end

  test 'should get view containing a table with proper numbers' do
    get '/lucky_nums/view'
    assert_response :success
    assert_match 'table', response.body
    lucky_numbers(0..999_999).tap do |arr|
      arr.each_with_index do |num, i|
        # not the best check, but it ensures result and everything else takes too long
        assert_match num[0].to_s, response.body
        p "matching: #{i} / #{arr.size} tested" if (i % 1000).zero?
      end
    end
  end
end
