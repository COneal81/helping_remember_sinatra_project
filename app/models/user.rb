class User < ActiveRecord::Base
    validates :username, length: { minimum: 2 }
    validates :email, uniqueness: true
    validates :password, confirmation: true
    validates :password, length: { in: 6..20 } 
    
    has_many :memories
    #this is a marco for the bcrypt gem
    # must have a column of password_digest as a type string
    has_secure_password
end

