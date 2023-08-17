require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'user', email: 'user@example.com', password: '123456')
    @category = Category.create(user: @user, name: 'category', icon: 'image.png')
    @operation = Operation.create(author: @user, name: 'operation', amount: 100)
    @operation_categories = OperationCategory.create(operation: @operation, category: @category)

    sign_in @user
  end

  context 'home page' do
    before { visit categories_path }

    it 'has the proper title' do
      expect(page).to have_content('Home')
    end

    it 'has category details' do
      expect(page).to have_content(@category.name)
      expect(page).to have_content(@category.operations.sum(:amount))
      expect(page).to have_content(@category.updated_at.strftime('%d %b %Y'))
      expect(page).to have_css("img[src*='#{@category.icon}']")
    end

    it 'has new category link button' do
      expect(page).to have_content('Add category')
      click_link 'Add category'
      expect(current_path).to eq(new_category_path)
    end
  end

  context 'transactions page' do
    before { visit category_path(@category) }

    it 'has the proper title' do
      expect(page).to have_content('Transactions')
    end

    it 'has transaction total' do
      expect(page).to have_content('Total')
      expect(page).to have_content(@category.operations.sum(:amount))
    end

    it 'has transaction details' do
      expect(page).to have_content(@operation.updated_at.strftime('%d %b %Y'))
      expect(page).to have_content(@operation.name)
      expect(page).to have_content(@operation.amount)
    end

    it 'has new transaction link button' do
      expect(page).to have_content('Add transaction')
      click_link 'Add transaction'
      expect(current_path).to eq(new_category_operation_path(@category))
    end
  end

  context 'new category page' do
    before { visit new_category_path }

    it 'has the proper title' do
      expect(page).to have_content('New category')
    end

    it 'has form fields' do
      expect(page).to have_css("input[placeholder*='Name']")
      expect(page).to have_css("input[placeholder*='Icon url']")
      expect(page).to have_css("input[name*='commit']")
    end
  end
end
