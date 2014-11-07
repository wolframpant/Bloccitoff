require 'rails_helper'
require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!


feature "age of todo" do
  scenario "calculates the age of a todo in days" do
    user = create(:user)
    login_as(user, :scope => :user)
    todo = create(:todo, user: user, created_at:(Time.now - 3.days))

    expect((((todo.created_at + 7.days) - Time.now)/(60*60*24)).round).to equal(4)
  end
end

feature "default scope" do
  scenario "lists todos in descending order of creation" do
    user = create(:user)
    login_as(user, :scope => :user)
    todo = create(:todo, user: user, description: "Second Todo", created_at:(Time.now - 3.days))
    todo = create(:todo, user: user, description: "First Todo", created_at:(Time.now))
    visit todos_path
    expect(page).to have_content("First Todo 7 Second Todo 4")
  end
end    
