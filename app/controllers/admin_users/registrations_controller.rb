class AdminUsers::RegistrationsController < Devise::RegistrationsController
  protected

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_up_params
  #  devise_parameter_sanitizer.for(:sign_up) << :name
  #end

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
  #  devise_parameter_sanitizer.for(:account_update) << [:name, :pic]
  #end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
