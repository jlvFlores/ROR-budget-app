require 'rails_helper'

RSpec.describe 'Operations', type: :feature do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'user', email: 'user@example.com', password: '123456')
    @category = Category.create(user: @user, name: 'category', icon: 'image.png')
    @operation = Operation.create(author: @user, name: 'operation', amount: 100)
    @operation_categories = OperationCategory.create(operation: @operation, category: @category)

    sign_in @user
  end

  context 'new transaction page' do
    before { visit new_category_operation_path(@category) }

    it 'has the proper title' do
      expect(page).to have_content('New transaction')
    end

    it 'has form fields' do
      expect(page).to have_css("input[placeholder*='Name']")
      expect(page).to have_css("input[placeholder*='Amount']")
      expect(page).to have_css("select[name*='operation[category_id]']")
      expect(page).to have_css("input[name*='commit']")
    end
  end
end
