Devise::PasswordsController.send(:define_method, :after_sending_reset_password_instructions_path_for) do |resource_name|
  "new_#{resource_name}_session".to_sym
end
