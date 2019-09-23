class CreateMemoryCategories < ActiveRecord::Migration
  def change
    create_table :memory_categories do |t|
      t.integer :memory_id
      t.integer :category_id
    end
  end
end
