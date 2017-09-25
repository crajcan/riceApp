require 'test_helper'

class AccessCodeTest < ActiveSupport::TestCase

  def setup
    @access_code = AccessCode.new
  end

  test "code should be present" do
    @access_code.code = ""
    assert_not @access_code.valid?
  end

  test "code must be atleast 3 characters" do
    @access_code.code = "aaaaa"
    assert_not @access_code.valid?
    @access_code.code = "aaaaaa"
    assert @access_code.valid?
  end

end
