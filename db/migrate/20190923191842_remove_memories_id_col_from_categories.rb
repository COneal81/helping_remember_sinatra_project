class RemoveMemoriesIdColFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :memories_id
  end
end
