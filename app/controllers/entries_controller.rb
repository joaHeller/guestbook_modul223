class EntriesController < ApplicationController
  before_action :require_login
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

   def index
    @entries = current_user.entries
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = current_user.entries.build
  end

  def edit
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      redirect_to entries_path, notice: 'Eintrag wurde erfolgreich erstellt.'
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to entries_path, notice: 'Eintrag erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path, notice: 'Eintrag erfolgreich gelöscht.'
  end

  private

  def set_entry
    @entry = current_user.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:name, :title, :content, :email, :date, :message)
  end

  def require_login
    unless current_user
      flash[:error] = "Sie müssen eingeloggt sein, um diese Aktion durchzuführen."
      redirect_to login_path
    end
  end
end