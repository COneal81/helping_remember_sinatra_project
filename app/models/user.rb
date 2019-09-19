class User < ActiveRecord::Base
    has_many :memories
    has_many :categories, through: :memories
end
