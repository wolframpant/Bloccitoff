require 'rails_helper'

feature 'User Registration' do
  scenario 'Successfully' do
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

    # open email
    # click confirmation link in email

    # expect page to have "you are confirmed" text

    # click link "Sign in"
    # fill in sign in form
    # click button to sign in
    # check for "You are signed in " message
    # Check username is in page
  end
end 