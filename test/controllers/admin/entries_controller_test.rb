require "test_helper"

class Admin::EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_entries_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_entries_destroy_url
    assert_response :success
  end
end
