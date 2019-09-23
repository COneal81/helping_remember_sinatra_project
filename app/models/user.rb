class User < ActiveRecord::Base
    has_many :memories
    has_many :categories, through: :memories
    has_secure_password
end
