require 'rails_helper'

RSpec.describe 'Admins', type: :feature do
  context 'log in as admin' do
    it 'is succesfull' do
      visit 'http://localhost:3000'

      click_link 'Sign in as Admin'

      within('form') do
        fill_in 'Email', with: 'adminone@test.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content('Congratulate you are admin')
      click_link 'Kudos'
      expect(page).to have_content('Kudos')
      find('tr', text: '8').click_link('Show')
      expect(page).to have_content('Title')
      click_link 'Destroy'
      expect(page).to have_content('Kudos')
      click_link 'Back'

      click_link 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
