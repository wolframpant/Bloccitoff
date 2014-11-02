feature "User views todos list" do
  scenario "Successfully" do

  before do
    @user1 = create(:user)
    todo1 = create(:todo, user: @user1)
    @user2 = create(:user)
    3.times { create(:todo, user: @user2) }
    @user3 = create(:user)
    2.times { create(:todo, user: @user3) }

    visit todos_path
    expect(page).to have_content('Todo 1')
    expect(page).to have_content('Todo 2')
    expect(page).to have_content('Todo 3')

  end
end