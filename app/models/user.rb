class User < ApplicationRecord
    has_many :entries
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 6 }
end
