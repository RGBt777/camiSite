class Product < ApplicationRecord
validates :productname, presence: true
validates :saleprice, presence: true
validates :purchaseprice, presence: true
has_many :review, dependent: :destroy
has_many :reorder, dependent: :destroy
has_many :trandetail, dependent: :destroy
end
