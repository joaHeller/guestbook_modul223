class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :logout_redirect]
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Benutzer wurde erfolgreich erstellt.'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profil wurde erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def logout_redirect
    redirect_to @user, notice: 'Redirected to your profile page.'
  end

  private


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo)
  end

  def require_login
    unless current_user
      flash[:error] = "Sie müssen angemeldet sein, um diese Seite zu sehen."
      redirect_to login_path
    end
  end

  def require_correct_user
    unless current_user == @user
      flash[:error] = "Sie haben keine Berechtigung, diese Aktion durchzuführen."
      redirect_to root_path
    end
  end
end