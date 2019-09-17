#This is a view helper, it helps with multiple views and prevents repeative code.

module ApplicationHelper
    # If the current user is coming from the user model as guest, show register and login button otherwise show logout button
    def login_helper style = ''
        if current_user.is_a?(GuestUser)
            (link_to "Register", new_user_registration_path, class: style) +
            "".html_safe +
            (link_to "Login", new_user_session_path, class: style)
        else
            link_to "Logout", destroy_user_session_path, method: :delete, class: style
        end
    end

end
