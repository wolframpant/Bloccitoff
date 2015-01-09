class AddCutoffToLists < ActiveRecord::Migration
  def change
    add_column :lists, :cutoff, :integer
  end
end
