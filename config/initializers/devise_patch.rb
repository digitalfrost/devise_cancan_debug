Devise::PasswordsController.send(:define_method, :after_sending_reset_password_instructions_path_for) do |resource_name|
  new_user_session_path
end
