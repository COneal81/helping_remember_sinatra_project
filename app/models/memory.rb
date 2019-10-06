class Memory < ActiveRecord::Base
    belongs_to :user
    belongs_to :category

    validate :title, :description, :date
end

