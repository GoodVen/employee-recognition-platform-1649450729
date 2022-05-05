require 'rails_helper'

RSpec.describe 'Employees', type: :feature do
  context 'create new employee' do
    it 'is succesfull' do
      visit 'http://localhost:3000/employee/sign_up'
      within('form') do
        fill_in 'Email', with: 'testo5@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Employee was successfully created.')

      visit 'http://localhost:3000/employee/sign_in'
      within('form') do
        fill_in 'Email', with: 'testo5@test.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('You signed in as testo5@test.com')
      click_link 'Sign out'
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
