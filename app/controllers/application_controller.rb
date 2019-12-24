class ApplicationController < ActionController::Base
  before_action :whitelist_devise_paramaters, if: :devise_controller?

  private

  def whitelist_devise_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
