module ApplicationHelper
  def welcome_message
    message = "Welcome, #{current_user.username}"
    content_tag(:p, message)
  end

  def login_helper
    if current_user.is_a?(Guest)
      (link_to 'Register', new_user_registration_path) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete
    end
  end
end
