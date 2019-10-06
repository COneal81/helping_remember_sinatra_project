class Memory < ActiveRecord::Base
    belongs_to :user
    belongs_to :category

    # impliment validators
    validates :title, :description, :date, presence: true
end

