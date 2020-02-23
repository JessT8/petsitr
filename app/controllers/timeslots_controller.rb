class TimeslotsController < ApplicationController

    before_action :authenticate_user!

    def new
    end

    def create
        @timeslot = Timeslot.new(timeslot_params)

        @timeslot.sitter = current_user.sitter
        if @timeslot.available_start_date == nil || @timeslot.available_end_date == nil
            redirect_to new_timeslot_path
        else
            if @timeslot.save
                redirect_to profile_path
            else
                render "/timeslots/new"
            end
        end
    end

    def edit
        @timeslot = Timeslot.find(params[:id])
    end

    def update
        if timeslot_params[:available_start_date] < timeslot_params[:available_end_date]
            @timeslot = Timeslot.find(params[:id])
            @timeslot.update(timeslot_params)
            redirect_to profile_path
        else
            redirect_to profile_path
        end
    end

private

    def timeslot_params
        params.require(:timeslot).permit(:available_start_date, :available_end_date)
    end

end