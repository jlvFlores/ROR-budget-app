require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(id: 1, name: 'user', email: 'user@example.com', password: '123456')
  end

  context '#validations' do
    it 'name should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'email should be present' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end
end
