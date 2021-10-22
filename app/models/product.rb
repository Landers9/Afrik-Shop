class Product < ApplicationRecord

  belongs_to :category, optional: true

  has_many :favories, dependent: :destroy

  has_many :carts, dependent: :destroy

  # has_many :cart_users, through: :carts, source: :user

  has_and_belongs_to_many :orders, dependent: :destroy

  validates :name, :description, :price, :image, presence: true

  validates :name,  uniqueness: true

  mount_uploader :image, ImageUploader
end
