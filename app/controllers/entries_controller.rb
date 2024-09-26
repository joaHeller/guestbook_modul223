class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to @entry, notice: 'Eintrag wurde erfolgreich erstellt.'
    else
      render :new
    end
  end

  def create
    @entry = Entry.new(entry_params)

    if params[:entry][:profile_pic]
      uploaded_file = params[:entry][:profile_pic]
      file_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
      File.open(file_path, 'wb') do |file|
        file.write(uploaded_file.read)
      end
      @entry.profile_pic = "/uploads/#{uploaded_file.original_filename}"
    end

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: "Gästebucheintrag wurde erfolgreich erstellt." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :email, :date, :message)
  end
end