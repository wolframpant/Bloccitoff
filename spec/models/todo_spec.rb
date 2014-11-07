require 'rails_helper'

describe Todo do

  context "age_of_todo" do
    it "calculates the age of a todo in days" do
      todo = build(:todo, created_at:(Time.now - 3.days))
      expect(todo.age_of_todo).to equal(4)
    end
  end

  context "validation" do
    it "validates description is present" do
      todo = build(:todo, description: nil)
      expect(todo.valid?).to eq(false)
      expect(todo.errors[:description]).to eq ["can't be blank"]
    end
  end


  context "default scope" do
    it "lists todos in descending order of creation" do
      user = create(:user)
      todo2 = create(:todo, user: user, description: "Second Todo", created_at:(Time.now - 3.days))
      todo1 = create(:todo, user: user, description: "First Todo", created_at:(Time.now))
      expect(Todo.all).to eq([todo1, todo2])
    end
  end    
end