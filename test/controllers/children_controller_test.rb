require 'test_helper'

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get children_index_url
    assert_response :success
  end

  test "should get show" do
    get children_show_url
    assert_response :success
  end

end
