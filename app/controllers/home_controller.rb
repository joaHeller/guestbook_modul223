class HomeController < ApplicationController
    def index
      @entries = Entry.order(created_at: :desc)
      @current_entry = @entries.first
      @prev_entry = @entries.second
      @next_entry = nil
    end
  end