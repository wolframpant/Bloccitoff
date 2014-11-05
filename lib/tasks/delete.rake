task delete_todos: :environment do
  deleted = Todo.where("created_at <=?", Time.now - 7.days).destroy_all
  puts "Deleted #{deleted.size} todos"
end