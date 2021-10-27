
require 'rails_helper'

RSpec.describe User, type: :model do
describe 'User model validation', type: :model do
  describe 'Validation test' do
    context 'If all user column exists'
      it 'success' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context 'If the user username is empty' do
      it 'Error' do
        user = FactoryBot.build(:user, username: "")
        expect(user).not_to be_valid
      end
    end

    context 'If the user email is empty' do
      it 'Error' do
        user = FactoryBot.build(:user, email: "")
        expect(user).not_to be_valid
      end
    end

    context 'If the user address is empty' do
      it 'Error' do
        user = FactoryBot.build(:user, address: "")
        expect(user).not_to be_valid
      end
    end

    context 'If the user password is empty' do
      it 'Error' do
        user = FactoryBot.build(:user, password: "")
        expect(user).not_to be_valid
      end
    end


    context 'If the user telephone is empty' do
      it 'Error' do
        user = FactoryBot.build(:user, telephone: "")
        expect(user).not_to be_valid
      end
    end

    context 'If the user is admin' do
      it 'Success' do
        user = FactoryBot.build(:admin)
        expect(user).to be_valid
      end
    end
  end
end
