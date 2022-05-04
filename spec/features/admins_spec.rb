require 'rails_helper'

RSpec.describe 'Admins', type: :feature do
  @admin = Admin.new(email:"admin1@test.com", password:'111111')
  @admin.save
  @employee1 = Employee.create!(email:"test1@test.com", password:'111111')
  @employee2 = Employee.create!(email:"test2@test.com", password:'111111')
  @kudo = Kudo.create!(title: '1', content: 'donef', giver: Employee.find_by(email: 'test1@test.com'), receiver: Employee.find_by(email: 'test2@test.com'))

  
  context 'log in as admin and RD kudo' do
    it 'is succesfull' do
      visit 'http://localhost:3000'

      click_link 'Sign in as Admin'

      within('form') do
        fill_in 'Email', with: 'admin1@test.com'
        fill_in 'Password', with: '111111'
      end
      click_button 'Log in'
      expect(page).to have_content('Congratulate you are admin')
      click_link 'Kudos'
      expect(page).to have_content('Kudos')
      click_link 'Show'
      expect(page).to have_content('Title')
      click_link 'Destroy'
      expect(page).to have_content('Kudo was successfully destroyed.')
      click_link 'Back'

      click_link 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
