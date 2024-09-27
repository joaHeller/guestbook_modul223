class SessionsController < ApplicationController

  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Erfolgreich eingeloggt'
    else
      flash.now[:alert] = "Ungültige E-Mail oder Passwort."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signup_path, notice: "Sie wurden ausgeloggt."
  end
end