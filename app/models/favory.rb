class Favory < ApplicationRecord
  belongs_to :product, optional: true
end