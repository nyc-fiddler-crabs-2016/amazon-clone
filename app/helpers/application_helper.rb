module ApplicationHelper

      def current_user
    @user ||= User.find session[:user_id] if session[:user_id]
  end

  def authorize_user!
    redirect_to new_session_path unless current_user.present?
  end

    def logged_in?
    current_user != nil
  end

end
