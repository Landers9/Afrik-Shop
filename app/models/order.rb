class Order < ApplicationRecord

  validates :total_price, :qt_product, presence: true

  has_and_belongs_to_many :products, optional: true

  belongs_to :user, optional: false

  has_one :note

  enum status: {
        progress: 0,
        complete: 1
  }

end
