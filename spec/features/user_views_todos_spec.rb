require 'rails_helper'
require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "User views todos list" do
  scenario "Successfully" do

    DatabaseCleaner.clean  
    user = create(:user)
    3.times { create(:todo, user: user) }
    
    login_as(user, :scope => :user)

    visit todos_path
    expect(page).to have_content('Fake description 3 7 Fake description 2 7 Fake description 1 7')
    
  end
end