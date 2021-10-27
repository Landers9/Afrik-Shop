
require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'Cart model validation', type: :model do
    describe 'Validation test' do
      context 'If the cart quantity is less than one' do
        it 'Error' do
          cart = FactoryBot.build(:cart, quantity: -10)
          expect(cart).not_to be_valid
        end
      end
    end
  end
end
