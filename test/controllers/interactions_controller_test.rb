require "test_helper"

class InteractionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interactions_index_url
    assert_response :success
  end

  test "should get new" do
    get interactions_new_url
    assert_response :success
  end
end
