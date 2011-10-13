require 'test_helper'

class PasswordsControllerTest < ActionController::TestCase
  tests Devise::PasswordsController
  include Devise::TestHelpers

  setup do
	setup_controller_for_warden
    request.env["devise.mapping"] = Devise.mappings[:user]

	@user = User.create(:email => "john@mail.com", :password => "qwerty", :password_confirmation => "qwerty")
	@user.confirm!
  end
  
  test "should redirect to login" do
    post :create, :user => {:email => @user.email }
    assert_redirected_to :new_user_session
  end  

  #test that any configuration or monkeypatch is not being cleaned out after first request.
  ########### WARNING #####################################################################
  #this test does not accurately reflect two successive requests in the browser where a 
  #monkey patch in an initializer file is applied to the first request but not the second
  #this test passes when it shouldn't
  ########################################################################################
  test "redirect should work for more than one request" do
    post :create, :user => {:email => @user.email }
    assert_redirected_to :new_user_session
    post :create, :user => {:email => @user.email }
    assert_redirected_to :new_user_session
  end

  
end
