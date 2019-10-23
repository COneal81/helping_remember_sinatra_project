class User < ActiveRecord::Base
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
    validates :password, length: { in: 6..20 }
    validates :username, length: { minimum: 2 }
    validates :email, uniqueness: true
    
    has_many :memories
    #this is a marco for the bcrypt gem, and takes in 
    # password_digest as an arguement.
    has_secure_password
end

