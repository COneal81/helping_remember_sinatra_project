class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :name
      t.string :description
      t.string :date
      t.string :image_url
      t.timestamps null: false
    end
  end

  def change 
    add_column :memories, :user_id, :integer
  end 
end
