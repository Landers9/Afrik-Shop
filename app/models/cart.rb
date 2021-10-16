class Cart < ApplicationRecord
  # has_many :products
  # belongs_to :user

  validates :sum_price, :number_product, presence: true

  belongs_to :product, optional: false

  belongs_to :user, optional: false
end
