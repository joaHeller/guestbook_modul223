require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @other_user = users(:two)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: "Test User", email: "test@example.com", password: "password", password_confirmation: "password" } }
    end

    assert_redirected_to root_url
  end

  test "should show user" do
    log_in_as(@user)
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    log_in_as(@user)
    patch user_url(@user), params: { user: { name: "Updated Name" } }
    assert_redirected_to user_url(@user)
    @user.reload
    assert_equal "Updated Name", @user.name
  end

  test "should redirect edit when not logged in" do
    get edit_user_url(@user)
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_url(@user), params: { user: { name: "Updated Name" } }
    assert_redirected_to login_url
  end

  private

  def log_in_as(user)
    post login_url, params: { session: { email: user.email, password: 'password' } }
  end
end