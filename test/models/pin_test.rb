require 'test_helper'

class PinTest < ActiveSupport::TestCase

  def setup
    @pin = Pin.new(user_id: users(:michael).id,
                   post_id: posts(:orange).id)
    @other = Pin.new(user_id: users(:michael).id,
                   post_id: posts(:orange).id)
  end

  test 'should be valid' do
    assert @pin.valid?
  end

  test 'should require a user' do
    @pin.user_id = nil 
    assert_not @pin.valid?
  end

  test 'should require a post' do
    @pin.post_id = nil
    assert_not @pin.valid? 
  end

  test 'should be unique' do
    assert_difference 'Pin.count', 1 do
      @pin.save
    end
    assert_no_difference 'Pin.count' do
      @other.save
    end
    @other.post_id = posts(:cat_video).id
    assert_difference 'Pin.count', 1 do
      @other.save
    end
  end

end
