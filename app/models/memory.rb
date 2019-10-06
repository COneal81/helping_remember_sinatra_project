class Memory < ActiveRecord::Base
    belongs_to :user
    belongs_to :category

    # impliment validators
    #FUTURE :  If the validators are changed, check the 
    # memories_controller - post/memories flash error message.  
    # This is hard coded for an easier user experience.

    validates :title, :description, :date, presence: true
end

