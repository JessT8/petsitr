class Sitter < ApplicationRecord
    belongs_to :user

    has_many :timeslots

    has_many :bookings

    has_and_belongs_to_many :pets

end