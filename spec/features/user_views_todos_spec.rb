require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "User views todos list" do
  scenario "Successfully" do

    user = create(:user)
    create(:todo, user: user, description: 'Buy Milk 1') 
    create(:todo, user: user, description: 'Buy Milk 2') 
    create(:todo, user: user, description: 'Buy Milk 3') 
    
    login_as(user, :scope => :user)

    visit todos_path
    expect(page).to have_content('Buy Milk 3 7 Buy Milk 2 7 Buy Milk 1 7')
    
  end
end