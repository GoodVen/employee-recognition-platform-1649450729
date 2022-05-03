require 'rails_helper'

RSpec.describe 'Employees', type: :feature do
  context 'create new employee' do
    it 'is succesfull' do
      visit 'http://localhost:3000/employees/sign_up'
      within('form') do
        fill_in 'Email', with: 'testo5@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
      click_link 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')

      within('form') do
        fill_in 'Email', with: 'testo5@test.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      click_link 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
