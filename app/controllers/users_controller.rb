class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if @user
      @entries = @user.entries
    else
      redirect_to root_path, alert: 'Benutzer nicht gefunden.'
    end
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Erfolgreich registriert!'
    else
      puts  @user.errors.inspect
      render :new
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'Profil erfolgreich aktualisiert.'
    else
      render :show
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end