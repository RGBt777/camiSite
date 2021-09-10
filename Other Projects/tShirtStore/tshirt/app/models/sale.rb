class Sale < ApplicationRecord
validates :saledate, presence: true
belongs_to :customer
has_many :saledetail, dependent: :destroy
end
