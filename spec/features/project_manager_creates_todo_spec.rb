require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'Project manager creates a TODO' do
  scenario 'Successfully' do
    user = create(:user, email: "abc@example.com")
    login_as(user, :scope => :user)
    visit new_todo_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect(page).to have_content('Your new TODO was saved')
    expect(page).to have_content('Meet up with the team')
  end
end

feature 'With description missing' do
  scenario 'Unsuccessfully' do
    user = create(:user, email: "abc@example.com")
    login_as(user, :scope => :user) 
    visit new_todo_path
    click_button 'Save'
    expect(page).to have_content('You forgot to enter a description')
  end
end

