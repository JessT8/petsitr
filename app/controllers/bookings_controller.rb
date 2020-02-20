class BookingsController < ApplicationController

    def new
        @sitter = Sitter.find(params[:id])
        @timeslots = Timeslot.where(sitter: @sitter)
    end

    def create
        @booking = Booking.new(booking_params)
        @sitter = Sitter.find(params[:id])

        @timeslots = Timeslot.all

        @timeslots.each do |timeslot|
            if @booking.start_date >= timeslot.available_start_date && @booking.end_date <= timeslot.available_end_date
                @timeslot = timeslot
                @booking.sitter = @sitter
                @booking.user = current_user
                @booking.save
                redirect_to(@sitter) and return
            end
        end
        redirect_back(fallback_location: root_path)
    end

    def show
        @sitter = Sitter.find(params[:id])
        @bookings = Booking.where(sitter: @sitter)
    end

    def update
        @book = Booking.new(booking_params);
        @booking = Booking.find(@book.id);
        if @book.status == true
            @booking.update(status: true)

            timeslots = Timeslot.all

            timeslots.each do |timeslot|
                if @booking.start_date >= timeslot.available_start_date && @booking.end_date <= timeslot.available_end_date
                    @timeslot = timeslot
                end
            end
            if @booking.start_date == @timeslot.available_start_date && @booking.end_date < @timeslot.available_end_date
                @timeslot.update(available_start_date: @booking.end_date)
            elsif @booking.end_date == @timeslot.available_end_date && @booking.start_date > @timeslot.available_start_date
                @timeslot.update(available_end_date: @booking.start_date)
            elsif @booking.start_date > @timeslot.available_start_date && @booking.end_date < @timeslot.available_end_date
                new_timeslot = Timeslot.new(available_start_date: @timeslot.available_start_date, available_end_date: @booking.start_date, sitter: @timeslot.sitter)
                new_timeslot.save
                @timeslot.update(available_start_date: @booking.end_date)
            else
                @timeslot.destroy
            end
        else
            @booking.update(status: false)
        end
        redirect_to bookings_path
    end

private

    def booking_params
        params.require(:booking).permit(:start_date, :end_date, :status, :id)
    end

end