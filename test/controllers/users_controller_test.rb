require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should get sign_in" do
    get users_sign_in_url
    assert_response :success
  end

end
