require 'rails_helper'

RSpec.feature "Employees", type: :feature do
  context 'create new employee' do
    scenario "should be succesfull" do
      visit "http://localhost:3000/employees/sign_up"
      within('form') do
        fill_in 'Email', with: 'test12@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
  context 'sign in' do
  end

end
