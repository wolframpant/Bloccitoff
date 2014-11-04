require 'rails_helper'

feature 'Project manager creates a TODO' do
  scenario 'Successfully' do
    user = create(:user, email: "abc@example.com")
    visit new_user_session_path
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    click_button('Log in') 
    expect(page).to have_content 'Signed in successfully.' 
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
    visit new_user_session_path
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    click_button('Log in') 
    expect(page).to have_content 'Signed in successfully.' 
    visit new_todo_path
    click_button 'Save'
    expect(page).to have_content('You forgot to enter a description')
  end
end

