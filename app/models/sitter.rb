class Sitter < ApplicationRecord
    belongs_to :user

    has_many :timeslots

    has_many :bookings

    has_and_belongs_to_many :pets

    validates :phone, presence: true, format: { with: /\^(?:\d{8}(?:\d{2}(?:\d{2})?)?|\(\+?\d{2,3}\)\s?(?:\d{4}[\s*.-]?\d{4}|\d{3}[\s*.-]?\d{3}|\d{2}([\s*.-]?)\d{2}\1\d{2}(?:\1\d{2})?))/, message:"Wrong format for numbers"}
end