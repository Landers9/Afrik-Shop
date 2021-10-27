require 'rails_helper'

RSpec.describe Favory, type: :model do
  describe 'Favory model validation', type: :model do
    describe 'Validation test' do
      context 'If the user_id and product_id Favory exists' do
        it 'Error' do
        favory = FactoryBot.build(:favory, user_id:2 , product_id:1)
          expect(favory).to be_valid
        end
      end
    end
  end
end
