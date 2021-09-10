class Saledetail < ApplicationRecord
validates :saleprice, numericality: true
belongs_to :sale, dependent: :destroy
belongs_to :product
end
