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
            redirect_to profile_path, flash: { error: "Timeslots already exist" } and return
        end
        @timeslot = Timeslot.new(timeslot_params)

        @timeslot.sitter = current_user.sitter
        if @timeslot.available_start_date == nil || @timeslot.available_end_date == nil
            redirect_to new_timeslot_path, flash: { error: "Timeslot Fields Empty" }
        else
            bookings = Booking.where(status: true).where(sitter: current_user.sitter).where.not('start_date > ? AND end_date > ?', @timeslot.available_end_date, @timeslot.available_end_date).where.not('start_date < ? AND end_date < ?', @timeslot.available_start_date, @timeslot.available_start_date)
            if bookings.length == 0
                if @timeslot.save
                    redirect_to profile_path
                else
                    redirect_to new_timeslot_path, flash: { error: "Something went wrong" }
                end
            else
                redirect_to new_timeslot_path, flash: { error: "Confirmed Booking Exists In Same Timeslot" }
            end
        end
    end

    def edit
        @timeslot = Timeslot.find(params[:id])
    end

    def update
        checks = Timeslot.new(timeslot_params)
        bookings = Booking.where(status: true).where(sitter: current_user.sitter).where.not('start_date > ? AND end_date > ?', checks.available_end_date, checks.available_end_date).where.not('start_date < ? AND end_date < ?', checks.available_start_date, checks.available_start_date)
        if bookings.length == 0
            timeslots = Timeslot.where(sitter: current_user.sitter).where.not(id: params[:id]).where.not('available_start_date > ? AND available_end_date > ?', checks.available_end_date, checks.available_end_date).where.not('available_start_date < ? AND available_end_date < ?', checks.available_start_date, checks.available_start_date)
            if timeslots.length == 0
                if timeslot_params[:available_start_date] <= timeslot_params[:available_end_date]
                    @timeslot = Timeslot.find(params[:id])
                    @timeslot.update(timeslot_params)
                    redirect_to profile_path
                else
                    redirect_to profile_path, flash: { error: "End Must Be Later Than Start Date" }
                end
            else
                redirect_to profile_path, flash: { error: "Timeslot Conflicts with Existing Timeslot"}
            end
        else
            redirect_to profile_path, flash: { error: "Confirmed Booking Exists in Same Timeslot" }
        end
    end

private

    def timeslot_params
        params.require(:timeslot).permit(:available_start_date, :available_end_date)
    end

end