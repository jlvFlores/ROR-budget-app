require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @user = User.create(id: 1, name: 'user', email: 'user@example.com', password: '123456')
    @category = Category.create(id: 1, user: @user, name: 'category', icon: 'icon')
  end

  context '#validations' do
    it 'name should be present' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'name length should not exceed 50 characters' do
      @category.name = 'a' * 50
      expect(@category).to be_valid

      @category.name = 'a' * 51
      expect(@category).to_not be_valid
    end

    it 'icon should be present' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end
end
