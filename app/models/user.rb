class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :address, :email, :encrypted_password, :telephone, presence: true

  has_many :carts, dependent: :destroy
  # has_many :cart_products, through: :carts, source: :product
  has_many :orders, dependent: :destroy

  has_many :favories, dependent: :destroy

end
