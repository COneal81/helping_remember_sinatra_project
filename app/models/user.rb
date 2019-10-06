class User < ActiveRecord::Base
    has_many :memories
    validates :password, confirmation: true
    #this is a marco for the bcrypt gem, and takes in 
    # password_digest as an arguement.
    has_secure_password
end
