require 'rails_helper'

feature "User views todos list" do
  scenario "Successfully" do

  
    @user = create(:user)
    3.times { create(:todo, user: @user2) }
  

    visit todos_path
    expect(page).to have_content('Fake description')
    
  end
end