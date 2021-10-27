require 'rails_helper'

RSpec.describe OrdersProduct, type: :model do
  describe 'OrdersProduct model validation', type: :model do
    describe 'Validation test' do
      context 'If the order_id and product_id OrdersProduct not exists' do
        it 'Error' do
        orders_product = FactoryBot.build(:orders_product, order_id:nil , product_id:nil)
          expect(orders_product).not_to be_valid
        end
      end
    end
  end
end
