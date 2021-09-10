class Customer < ApplicationRecord
validates :firstname, presence: true
validates :lastname, presence: true
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
validates :phone, numericality: true
validates :address1, presence: true
validates :city, presence: true
validates :zip, presence: true
validates :username, presence: true, uniqueness: true 
has_secure_password
has_many :sales, dependent: :destroy
has_many :review, dependent: :destroy
end

