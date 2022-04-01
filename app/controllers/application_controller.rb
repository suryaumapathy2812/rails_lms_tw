# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :set_layout
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password profile_picture])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name email password profile_picture])
  end

  def set_layout
    return 'application' if layout_exception

    if !current_user
      'default'
    elsif current_user.is_admin || current_user.is_trainer
      'admin'
      # NOTE testing purpose
      # 'default'
    else
      'default'
    end

  end

  def layout_exception
    _current_path = request.path
    _is_match = _current_path.match(/users/) ? true : false
    _is_match
  end
end
