require 'rails_helper'

RSpec.describe 'Admins', type: :feature do
  @admin = Admin.new(email:"admin1@test.com", password:'111111')
  @admin.save
  #@employee1 = Employee.create!(email:"test3@test.com", password:'111111', number_of_available_kudos: 10)
  #@employee2 = Employee.create!(email:"test4@test.com", password:'111111', number_of_available_kudos: 10)
  before(:each) do
    kudo = create(:kudo, title: '7', content: 'dojij', giver: Employee.find_by(email: 'test3@test.com'), receiver: Employee.find_by(email: 'test2@test.com'))
    @employee1 = Employee.create!(email:"test5@test.com", password:'111111', number_of_available_kudos: 10)
  end
  
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
      find('tr', text: '7').click_link('Show')
      expect(page).to have_content('Title')
      click_link 'Destroy'
      expect(page).to have_content('Kudo was successfully destroyed.')
      click_link 'Back'

      click_link 'Sign out'
      expect(page).to have_content('Signed out successfully.')
    end
  end

  context 'log in as admin and RD employee' do
    it 'is succesfull' do
      visit 'http://localhost:3000'

      click_link 'Sign in as Admin'

      within('form') do
        fill_in 'Email', with: 'admin1@test.com'
        fill_in 'Password', with: '111111'
      end

      click_button 'Log in'
      expect(page).to have_content('Congratulate you are admin')

      click_link 'Employees'
      expect(page).to have_content('Employees')
      find('tr', text: 'test5@test.com').click_link('Show')
      expect(page).to have_content('Number of availible kudos: 10')

      click_link 'Edit'
      expect(page).to have_content('Editing employee')
      within('form') do
        fill_in 'Number of available kudos', with: 12
      end
      click_button 'Update Employee'
      expect(page).to have_content('Employee was successfully updated.')

      find('tr', text: 'test5@test.com').click_link('Show')
      click_link 'Destroy'
      expect(page).to have_content('Employee was successfully destroyed.')
      click_link 'Back'

      click_link 'Sign out'
      expect(page).to have_content('Signed out successfully.')
    end
  end
end
