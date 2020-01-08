module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :whitelist_user_paramaters, only: [:create]

    def create
      super do |user|
        ActiveRecord::Base.transaction do
          result = Users::Create.call(user)
        end
      end
      render 'new' if result.failure?
    end

    private

    def whitelist_user_paramaters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :username, :role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
  end
end
