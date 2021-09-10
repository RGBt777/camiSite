class Category < ApplicationRecord
validates :categoryname, presence: true
has_many :product, dependent: :destroy
end
