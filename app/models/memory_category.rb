class MemoryCategory < ActiveRecord::Base
    belongs_to :memories
    belongs_to :categories
end
