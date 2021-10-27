
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Order model validation', type: :model do
    describe 'Validation test' do
      context 'If the order quantity is less than one' do
        it 'Error' do
          order = FactoryBot.build(:order, qt_product: -10)
          expect(order).not_to be_valid
        end
      end
    end
  end
end
