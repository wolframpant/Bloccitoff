feature 'User Registration' do
  scenario 'Successfully' do
    visit root_path
    click_link('Sign up')
    fill_in 'Name', with: 'Joe Schmo'
    fill_in 'email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password Confirmation', with: 'helloworld'
    click_button('Save')
    expect(page).to have_content 'Please check your email inbox for a confirmation email'

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