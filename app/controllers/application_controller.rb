 class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    
  protected

 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:password, :password_confirmation, :email, :company_name)
        
      # This one separates user params and its nested params (company) in case of nested attributes form
      # user_params.permit(:password, :password_confirmation, :email, company_attributes:[:name])

    end
  end
end
