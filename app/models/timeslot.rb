require 'date'

class Timeslot < ApplicationRecord

    belongs_to :sitter


    validate :time_logic, on: :create




    def time_logic
        if self.available_start_date.past?
            errors.add(:available_dates, "We can't timetravel yet. Please use a more current date")
        elsif self.available_start_date > self.available_end_date
            errors.add(:available_dates, "End time must be later than Start Time")
        end
    end


end