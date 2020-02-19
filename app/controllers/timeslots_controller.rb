class TimeslotsController < ApplicationController

    before_action :authenticate_user!

    def new
        @sitter_id = current_user.id
    end

    def create
        @timeslot = Timeslot.new(timeslot_params)

        @timeslot.sitter_id = current_user.id

        if @timeslot.save
            redirect_to @new_timeslot
        else
            @sitter_id = current_user.id
            render "/timeslots/new"
        end
    end

private

    def timeslot_params
        params.require(:timeslot).permit(:available_start_date, :available_end_date)
    end

end