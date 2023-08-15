require 'rails_helper'

RSpec.describe Operation, type: :model do
  before do
    @user = User.create(id: 1, name: 'user', email: 'user@example.com', password: '123456')
    @category = Category.create(id: 1, user: @user, name: 'category', icon: 'icon')
    @operation = Operation.create(id: 1, author: @user, name: 'operation 1', amount: 1.50)
  end

  context '#validations' do
    it 'name should be present' do
      @operation.name = nil
      expect(@operation).to_not be_valid
    end

    it 'amount should be present' do
      @operation.amount = nil
      expect(@operation).to_not be_valid
    end

    it 'amount should be grater than or equal to zero' do
      @operation.amount = -1
      expect(@operation).to_not be_valid

      @operation.amount = 0
      expect(@operation).to be_valid
    end
  end
end
