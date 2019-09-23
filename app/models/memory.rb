class Memory < ActiveRecord::Base
    belongs_to :user
    has_many :categories, through: :memory_categories
    has_many :memory_categories
end
