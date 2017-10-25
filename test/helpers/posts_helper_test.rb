require 'test_helper'

class PostsHelperTest < ActionView::TestCase
  
  def setup
    @event1 = posts(:event1)
    @event2 = posts(:event2)
    @event3 = posts(:event3)
    @event4 = posts(:event4)
  end 

  test "events getter should only get events in the given time range" do
    event_array = events(Time.now + 1.month, Time.now + 2.months) 
    assert event_array.include?(@event2)
    assert event_array.include?(@event3)
    assert_not event_array.include?(@event1)
    assert_not event_array.include?(@event4)
  end

end
