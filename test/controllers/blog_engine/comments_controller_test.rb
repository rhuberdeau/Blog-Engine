require 'test_helper'

module BlogEngine
  class CommentsControllerTest < ActionController::TestCase
    test "should get show" do
      get :show
      assert_response :success
    end

    test "should get create" do
      get :create
      assert_response :success
    end

  end
end
