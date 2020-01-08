module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :whitelist_user_paramaters, only: [:create]

    def new
      super
    end

    def create
      super
    end

    def update
      super
    end

    private

    def whitelist_user_paramaters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :username, :role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

    def sign_up_params
      super.merge(role: set_role, username: params[:user][:username])
    end

    def set_role
      params[:user][:role] || 'user'
    end
  end
end
