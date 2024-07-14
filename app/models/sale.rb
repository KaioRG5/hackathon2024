class Sale < ApplicationRecord
  has_many :dishes
  belongs_to :product
end
