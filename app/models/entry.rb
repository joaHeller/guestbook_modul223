class Entry < ApplicationRecord
  belongs_to :user
  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
