module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_devise_whitelist_parameters, if: :devise_controller?
  end

  private

  def configure_devise_whitelist_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
