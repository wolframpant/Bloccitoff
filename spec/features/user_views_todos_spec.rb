require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "User views todos list" do
  scenario "Successfully" do

  
    user = create(:user, email: "abc@example.com")
    3.times { create(:todo, user: user) }
    
    login_as(user, :scope => :user)

    visit todos_path
    expect(page).to have_content('Fake description')
    
  end
end