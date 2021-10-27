require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model validation', type: :model do
    describe 'Validation test' do
      context 'If the name category is empty' do
        it 'Error' do
        cart = FactoryBot.build(:category, name:"")
          expect(cart).not_to be_valid
        end
      end
    end
  end
end
