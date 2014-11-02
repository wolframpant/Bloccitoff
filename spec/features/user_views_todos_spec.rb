feature "User views todos list" do
  scenario "Successfully" do

    # FactoryGirl to create 3 todos
    create(:todo, description: "Todo 1")

    
    visit todos_path
    expect(page).to have_content('Todo 1')
    expect(page).to have_content('Todo 2')
    expect(page).to have_content('Todo 3')

  end
end