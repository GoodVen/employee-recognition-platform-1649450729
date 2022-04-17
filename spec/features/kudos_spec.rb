require 'rails_helper'

RSpec.feature "Kudos", type: :feature do
  context 'create new employee and create, update, delete new kudo' do
    scenario "should be succesfull" do
      visit 'http://localhost:3000/employees/sign_up'
      within('form') do
        fill_in 'Email', with:  "testo5@test.com"
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')

      click_link 'New Kudo'
      expect(page).to have_content('Navigation')
      within('form') do
        fill_in 'Title', with:  "some title"
        fill_in 'Content', with: 'Hi employee'
        #select "employee1@test.com"
      end
      click_button 'Create Kudo'
      expect(page).to have_content('Kudo was successfully created.')

      find('tr', text: "some title").click_link("Edit")
      #click_link 'Edit'
      expect(page).to have_content('Editing Kudo')
      within('form') do
        fill_in 'Title', with:  "some title!"
        fill_in 'Content', with: "Hi employee, hi"
        #select "employee1@test.com"
      end
      click_button 'Update Kudo'
      expect(page).to have_content('Kudo was successfully updated.')
      click_link 'Back'
      expect(page).to have_content('Kudos')

      find('tr', text: "some title!").click_link("Destroy")
      expect(page).to have_content('Kudo was successfully destroyed.')

      click_link 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')

      
      

    end
  end
end
