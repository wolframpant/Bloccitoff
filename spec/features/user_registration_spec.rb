require 'rails_helper'
require 'spec_helper'

feature 'User Registration' do
  scenario 'Successfully' do
    DatabaseCleaner.clean
    visit root_path
    within '.user-info' do
        click_link('Sign Up')
    end
    fill_in 'Name', with: 'Joe Schmo'
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password Confirmation', with: 'helloworld'
    click_button('Sign Up')
    expect(page).to have_content 'A message with a confirmation'
    open_last_email_for('abc@example.com')
    click_first_link_in_email(email=current_email)
    expect(page).to have_content 'Your email address has been successfully confirmed.'
    click_link('Sign In')
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    click_button('Log in') 
    expect(page).to have_content 'Signed in successfully.' 
    expect(page).to have_content 'Joe Schmo'
  end
end 