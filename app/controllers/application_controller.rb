class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter :configure_permitted_parameters, if: :devise_controller?

  # protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :single, :wife_name, :wife_email, :wedding_day, {:wife_image => [:wife_image_file_name, :wife_image_content_type, :wife_image_file_size, :wife_image_updated_at, :wife_image_fingerprint]}, {:family_image =>[ :wife_image_file_name, :wife_image_content_type, :wife_image_file_size, :wife_image_updated_at, :wife_image_fingerprint]}) }
  # end
  def after_sign_in_path_for(resource)
    branch_path
  end

  def after_sign_out_path_for(resource)
    admin_root_path
  end
end
