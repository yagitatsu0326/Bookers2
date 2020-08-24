class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
   if current_user.id
   	  user_path(resource.id)
   else # ログイン後に遷移するpathを設定
      root_path
   end
  end


  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :encrypted_password ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password])
  end

end
