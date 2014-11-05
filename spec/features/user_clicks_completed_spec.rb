require 'rails_helper'

feature 'user clicks completed' do
  scenario "Successfully" do
     user = create(:user, email: "abc@example.com")
     create(:todo, user: user)
    
    visit new_user_session_path
    fill_in 'Email', with: 'abc@example.com'
    fill_in 'Password', with: 'helloworld'
    click_button('Log in') 
    expect(page).to have_content 'Signed in successfully.' 

    visit todos_path
    expect(page).to have_content('Fake description')

    click_button 'Completed'
    expect(page).to have_content('Your completed Todo has been deleted.')
    expect(page).not_to have_content('Fake description')
    
  end
end
