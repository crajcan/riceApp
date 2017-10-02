require 'test_helper'

class DeactivateTest < ActionDispatch::IntegrationTest

  def setup
   @archer = users(:archer)
  end

  test "account deactivation interface" do
    log_in_as(users(:archer))
    get '/deactivate'
    assert_response :success
    assert_match "deactivate", response.body
  end


end
