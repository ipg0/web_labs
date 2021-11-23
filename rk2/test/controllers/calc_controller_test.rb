require "test_helper"

class CalcControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get calc_input_url
    assert_response :success
  end

  test "should get output" do
    get calc_output_url
    assert_response :success
  end
end
