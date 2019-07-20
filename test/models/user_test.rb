require 'test_helper'

#bundle exec rake test test/models/user_test.rb
class UserTest < ActiveSupport::TestCase

    test "blank fields" do
      user = User.new
      assert_not user.save
      p user.errors
    end

    test "fields are not blank correct forma" do
      user = User.new
      user.name = "Aliat"
      user.image_url = "http://cdn.greatfeedspot.com/img002.png"
      assert user.save
    end

    test "user name not presence" do
      user = User.new
      user.image_url = "http://cdn.greatfeedspot.com/img002.png"
      assert_not user.save
      p user.errors
    end

    test "user img not presence" do
      user = User.new
      user.name = "TalentYup"
      assert_not user.save
      p user.errors
    end

    test "user name format" do
      user = User.new
      user.name = "Med132"
      user.image_url = "http://cdn.greatfeedspot.com/img002.png"
      assert_not user.save
      p user.errors
    end

    test "user length minimum" do
      user = User.new
      user.name = "Yi"
      user.image_url = "http://cdn.greatfeedspot.com/img002.png"
      assert_not user.save
      p user.errors
    end

    test "user length maximum" do
      user = User.new
      user.name = "ElMoussaouiMohamed"
      user.image_url = "http://cdn.greatfeedspot.com/img002.png"
      assert_not user.save
      p user.errors
    end

=begin

test "should show user" do
    get :show, id: @user.id
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user.id, user: {}
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.id
    end

    assert_redirected_to users_path
  end

  private

    def initialize_user
      @user = users(:one)
    end

=end


  end
