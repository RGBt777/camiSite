class Transaction < ApplicationRecord
validates :saledate, presence: true
belongs_to :customer
has_many :trandetail, dependent: :destroy
end


