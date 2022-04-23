require 'rails_helper'

RSpec.feature "Admins", type: :feature do
  context 'log in as admin' do
    scenario "should be succesfull" do
      visit 'http://localhost:3000'
      
      click_link 'Sign in as Admin'
      
      within('form') do
        fill_in 'Email', with:  "adminone@test.com"
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content('Congratulate you are admin')
      click_link 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')

    end
  end
end
