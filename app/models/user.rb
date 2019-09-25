class User < ActiveRecord::Base
    has_many :memories
    has_secure_password
end
