require "test_helper"

class ProcessorControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get processor_input_url
    assert_response :success
  end

  test "should get output" do
    get processor_output_url
    assert_response :success
  end
end
