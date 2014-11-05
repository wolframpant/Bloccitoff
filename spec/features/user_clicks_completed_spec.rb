require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'user clicks completed' do
  scenario "Successfully" do
    user = create(:user, email: "abc@example.com")
    create(:todo, user: user)
    
    login_as(user, :scope => :user)

    visit todos_path
    expect(page).to have_content('Fake description')

    click_button 'Completed'
    expect(page).to have_content('Your completed Todo has been deleted.')
    expect(page).not_to have_content('Fake description')
    
  end
end
