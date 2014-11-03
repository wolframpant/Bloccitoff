require 'rails_helper'

feature "User views todos list" do
  scenario "Successfully" do

  
    user = create(:user, email: "abc@example.com")
    3.times { create(:todo, user: user) }
    
    visit new_user_session_path
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    click_button('Log in') 
    expect(page).to have_content 'Signed in successfully.' 

    visit todos_path
    expect(page).to have_content('Fake description')
    
  end
end