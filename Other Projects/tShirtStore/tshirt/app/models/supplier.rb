class Supplier < ApplicationRecord
validates :companyname, presence: true
validates :pointofcontact, presence: true
validates :phone, numericality: true
has_many :reorder, dependent: :destroy
end
