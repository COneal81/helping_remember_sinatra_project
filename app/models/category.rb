class Category < ActiveRecord::Base
    belongs_to :memories
    belongs_to :users
end
