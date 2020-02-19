class Sitter < ApplicationRecord
    belongs_to :user
    has_many :timeslot
end