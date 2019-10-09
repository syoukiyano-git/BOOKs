class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  layout :layout_by_resource
  
  def after_sign_out_path_for(resource)
      '/users/sign_in'
  end 
  
  def after_sign_in_path_for(resource)
    '/products'
  end 
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image ])
  end 
  
  protected
  def layout_by_resource
    if devise_controller?
      false
    else
      "application"
    end
  end 
end
