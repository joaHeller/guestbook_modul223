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
    
    Rails.logger.debug "Entry params: #{entry_params.inspect}"
    Rails.logger.debug "Entry valid? #{@entry.valid?}"
    Rails.logger.debug "Entry errors: #{@entry.errors.full_messages}" if @entry.invalid?
    
    respond_to do |format|
      if @entry.save
        Rails.logger.debug "Entry saved successfully"
        format.html { redirect_to entries_path, notice: 'Eintrag wurde erfolgreich erstellt.' }
        format.turbo_stream { redirect_to entries_path }
      else
        Rails.logger.debug "Failed to save entry"
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@entry, partial: 'form', locals: { entry: @entry }) }
      end
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
    params.require(:entry).permit(:name, :email, :content, :message)
  end

  def require_login
    unless current_user
      flash[:error] = "Sie müssen eingeloggt sein, um diese Aktion durchzuführen."
      redirect_to login_path
    end
  end
end

