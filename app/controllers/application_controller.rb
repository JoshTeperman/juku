class ApplicationController < ActionController::Base
  include DeviseWhitelist

  def current_user
    super || guest_user
  end

  private

  def guest_user
    Guest.new(email: "guest_#{Time.now.to_i}@guest.com", username: 'Guest')
  end
end
