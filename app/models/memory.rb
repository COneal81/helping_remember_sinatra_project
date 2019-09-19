class Memory < ActiveRecord::Base
    belongs_to :users
    has_many :categories
end
