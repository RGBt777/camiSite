class Trandetail < ApplicationRecord
validates :saleprice, numericality: true
belongs_to :sales, dependent: :destroy
belongs_to :product
end
