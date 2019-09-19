class AddColumnMemoriesId < ActiveRecord::Migration
  def change
      add_column :categories, :memories_id, :integer  
  end
end
