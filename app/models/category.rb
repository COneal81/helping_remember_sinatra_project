class Category < ActiveRecord::Base
    has_many :users, through: :memories
    has_many :memory_categories
    has_many :users, through: :memory_categories
end
