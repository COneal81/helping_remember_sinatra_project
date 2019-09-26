class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :title
      t.text :description
      t.string :date
      t.string :image_url
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
