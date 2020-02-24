class TimeslotsController < ApplicationController

    before_action :authenticate_user!

    def new
        timeslot_check = Timeslot.where(sitter: current_user.sitter)
        if timeslot_check.length > 0
            redirect_to profile_path
        end
    end

    def create
        #check if timeslot has already been exists
        timeslot_check = Timeslot.where(sitter: current_user.sitter)
        if timeslot_check.length > 0
            redirect_to profile_path and return
        end
        @timeslot = Timeslot.new(timeslot_params)

        @timeslot.sitter = current_user.sitter
        if @timeslot.available_start_date == nil || @timeslot.available_end_date == nil
            redirect_to new_timeslot_path
        else
            bookings = Booking.where(status: true).where(sitter: current_user.sitter).where.not('start_date > ? AND end_date > ?', @timeslot.available_end_date, @timeslot.available_end_date).where.not('start_date < ? AND end_date < ?', @timeslot.available_start_date, @timeslot.available_start_date)
            if bookings.length == 0
                if @timeslot.save
                    redirect_to profile_path
                else
                    render "/timeslots/new"
                end
            else
                redirect_to new_timeslot_path
            end
        end
    end

    def edit
        @timeslot = Timeslot.find(params[:id])
    end

    def update
        booking_check = Timeslot.new(timeslot_params)
        bookings = Booking.where(status: true).where(sitter: current_user.sitter).where.not('start_date > ? AND end_date > ?', booking_check.available_end_date, booking_check.available_end_date).where.not('start_date < ? AND end_date < ?', booking_check.available_start_date, booking_check.available_start_date)
        if bookings.length == 0
            if timeslot_params[:available_start_date] < timeslot_params[:available_end_date]
                @timeslot = Timeslot.find(params[:id])
                @timeslot.update(timeslot_params)
                redirect_to profile_path
            else
                redirect_to profile_path
            end
        else
            redirect_to profile_path
        end
    end

private

    def timeslot_params
        params.require(:timeslot).permit(:available_start_date, :available_end_date)
    end

end