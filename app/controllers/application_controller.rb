class ApplicationController < ActionController::Base
  layout :set_layout
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :profile_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :profile_picture])
  end

  def set_layout
    _layout = ""
    if (layout_exception)
      return "application"
    end

    if (current_user && (current_user.role.name != "STUDENT"))
      _layout = "admin"
    else
      _layout = "default"
    end
    _layout
  end

  def layout_exception
    _current_path = request.path
    puts "hello"
    _is_match = _current_path.match(/users/) ? true : false
    puts "it is a: #{_is_match}"
    _is_match
  end

end
