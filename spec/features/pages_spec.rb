require 'rails_helper'

RSpec.describe 'Pages', type: :feature do
  include Devise::Test::IntegrationHelpers

  context 'splash screen' do
    before { visit root_path }

    it 'has the logo' do
      expect(page).to have_css("img[alt*='Budget App Logo']")
    end

    it 'has login link button' do
      expect(page).to have_content('Log In')
      click_link 'Log In'
      expect(current_path).to eq(new_user_session_path)
    end

    it 'has sign up link button' do
      expect(page).to have_content('Sign Up')
      click_link 'Sign Up'
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
