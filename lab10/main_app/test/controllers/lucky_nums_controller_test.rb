require 'test_helper'

CHARS = ('0'..'9').to_a

class LuckyNumsControllerTest < ActionDispatch::IntegrationTest
  def get_xml(from, to)
    get root_path, params: { from: from, to: to, format: 'xml' }
    response.body
  end

  test 'should get different outputs when different inputs given' do
    assert_not_equal get_xml('0', '9999'), get_xml('0', '99999')
  end
end
