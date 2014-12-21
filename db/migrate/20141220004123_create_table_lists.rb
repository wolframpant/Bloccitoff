class CreateTableLists < ActiveRecord::Migration
  
  def change
    create_table :lists do |l|
      l.string :title
      l.integer :user_id
      
      l.timestamps
    end
    
  end
  
end
