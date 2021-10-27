class Favory < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user, optional: true

  validates :user_id, uniqueness: {scope: :product_id} 
end
