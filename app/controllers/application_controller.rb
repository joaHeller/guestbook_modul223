class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to login_path, alert: "Sie müssen eingeloggt sein, um diese Seite zu sehen." unless user_signed_in?
  end
  def require_login
    unless current_user
      flash[:error] = "Sie müssen eingeloggt sein, um diese Aktion durchzuführen."
      redirect_to login_path
    end
  end
end
