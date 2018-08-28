require 'test_helper'

class TeachingGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teaching_groups_index_url
    assert_response :success
  end

  test "should get show" do
    get teaching_groups_show_url
    assert_response :success
  end

end
