class Entry < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :name, :email, :message, presence: true
  validates :title, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
