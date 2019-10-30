class User < ActiveRecord::Base
    validates :username, length: { minimum: 2 }
    validates :email, uniqueness: true
    validates :password, confirmation: true
    validates :password, length: { in: 6..20 } 
    
    
    has_many :memories
    #this is a marco for the bcrypt gem, and takes in 
    # password_digest as an arguement.
    has_secure_password
end

