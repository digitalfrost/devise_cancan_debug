require 'test_helper'

class PasswordsControllerTest < ActionController::TestCase
  tests Devise::PasswordsController
  include Devise::TestHelpers
  
  test "should redirect to login" do
	setup_controller_for_warden
    request.env["devise.mapping"] = Devise.mappings[:user]

	u = User.create(:email => "john@mail.com", :password => "qwerty", :password_confirmation => "qwerty")
	u.confirm!
    post :create, :user => {:email => u.email }
    assert_redirected_to :new_user_session
  end  

  
end
