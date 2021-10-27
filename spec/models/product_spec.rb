
require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Product model validation', type: :model do
    describe 'Validation test' do
      context 'If the product image is empty' do
        it 'Error' do
          product = FactoryBot.build(:product, image: "")
          expect(product).not_to be_valid
        end
      end

      context 'If the product price is less than zero' do
        it 'Error' do
          product = FactoryBot.build(:product, price: -232)
          expect(product).not_to be_valid
        end
      end

      context 'If the product is valid' do
        it "is invalid without content" do
          product = Product.create({
          })
          expect(product).not_to be_valid
        end
      end
    end
  end
end
