class HomeController < ApplicationController
    skip_before_action :require_login, only: [:index]
  
    def index
      if current_user
        @entries = Entry.order(created_at: :desc)
        @current_entry = @entries.first
        render 'guestbook'
      else
        redirect_to login_path
      end
    end
  end
  
  
  
 