require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

  def setup
    @relationship = Relationship.new(unfollower_id: users(:michael).id,
                                     unfollowed_id: users(:archer).id)
  end

  test "should be valid" do
    assert @relationship.valid?
  end

  test "should require a unfollower_id" do
    @relationship.unfollower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a unfollowed_id" do
    @relationship.unfollowed_id = nil
    assert_not @relationship.valid?
  end

end

