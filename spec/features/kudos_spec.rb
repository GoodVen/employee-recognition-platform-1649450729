require 'rails_helper'

RSpec.describe 'Kudos', type: :feature do
  context 'create new employee and create, update, delete new kudo' do
    it 'is succesfull' do
      visit 'http://localhost:3000/employee/sign_up'
      within('form') do
        fill_in 'Email', with: 'testo5@test.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Employee was successfully created.')

      visit 'http://localhost:3000/employee/sign_up'
      within('form') do
        fill_in 'Email', with: 'testo4@test.com'
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
      expect(page).to have_content('Max Kudos available:10')

      click_link 'Kudos'
      expect(page).to have_content('Number of available Kudos = 10')
      click_link 'New Kudo'

      within('form') do
        fill_in 'Title', with: '1'
        fill_in 'Content', with: 'Hi employee'
        select 'testo4@test.com'
      end
      click_button 'Create Kudo'
      expect(page).to have_content('Kudo was successfully created.')
      expect(page).to have_content('Number of available Kudos = 9')

      find('tr', text: '1').click_link('Edit')
      expect(page).to have_content('Editing Kudo')
      within('form') do
        fill_in 'Title', with: '2!'
        fill_in 'Content', with: 'Hi employee, hi'
      end
      click_button 'Update Kudo'
      expect(page).to have_content('Kudo was successfully updated.')
      click_link 'Back'
      expect(page).to have_content('Kudos')

      find('tr', text: '2!').click_link('Destroy')
      expect(page).to have_content('Kudo was successfully destroyed.')
      expect(page).to have_content('Number of available Kudos = 10')
      click_link 'Back'

      click_link 'Sign out'
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
