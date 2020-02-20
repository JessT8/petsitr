class BookingsController < ApplicationController

    def new
        @timeslots = Timeslot.where(sitter: current_user.sitter)
    end



private



end