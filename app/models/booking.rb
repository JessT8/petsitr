require 'date'

class Booking < ApplicationRecord

    belongs_to :sitter

    belongs_to :user

    validate :time_logic, on: :create




    def time_logic
        if self.start_date.past?
            errors.add(:available_dates, "We can't timetravel yet. Please use a more current date")
        elsif self.start_date > self.end_date
            errors.add(:available_dates, "End date must be later than Start Date")
        end
    end


end