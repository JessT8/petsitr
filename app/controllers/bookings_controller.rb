class BookingsController < ApplicationController
  before_action :authenticate_user!
    def new
        @sitter = Sitter.find(params[:id])
        @timeslots = Timeslot.where(sitter: @sitter)

        @earliest =  Timeslot.where(sitter: @sitter).minimum('available_start_date')
        @latest =Timeslot.where(sitter: @sitter).maximum('available_end_date')
    end

    def create
        @booking = Booking.new(booking_params)
        @sitter = Sitter.find(params[:id])
        @timeslots = Timeslot.where(sitter: @sitter)
        @timeslots.each do |timeslot|
            if (@booking.start_date >= timeslot.available_start_date && @booking.end_date <= timeslot.available_end_date)
                @timeslot = timeslot
                @booking.sitter = @sitter
                @booking.user = current_user
                @booking.save
                redirect_to(bookings_path) and return
            end
        end
        redirect_back(fallback_location: root_path)
    end

    def show
        @mybookings = Booking.where(user: current_user)
        @bookings = Booking.where(sitter: current_user.sitter)
    end

    def update
        
        @book = Booking.new(booking_params);
        @booking = Booking.find(@book.id);
        if @book.status == true
            timeslots = Timeslot.where(sitter: current_user.sitter)

            timeslots.each do |timeslot|

                if @booking.start_date >= timeslot.available_start_date && @booking.end_date <= timeslot.available_end_date
                    @timeslot = timeslot
                end
            end

            if @booking.start_date == @timeslot.available_start_date && @booking.end_date < @timeslot.available_end_date
                @timeslot.update(available_start_date: @booking.end_date + 1)
                @booking.update(status: true)
                @bookings = Booking.where("start_date <= ? or end_date >= ?", @booking.start_date, @booking.end_date)
                @bookings.each do |booking|
                    booking.update(status: false)
                end
            elsif @booking.end_date == @timeslot.available_end_date && @booking.start_date > @timeslot.available_start_date
                @timeslot.update(available_end_date: @booking.start_date - 1)
                @booking.update(status: true)
                @bookings = Booking.where("start_date <= ? or end_date >= ?", @booking.start_date, @booking.end_date)
                @bookings.each do |booking|
                    booking.update(status: false)
                end
            elsif @booking.start_date > @timeslot.available_start_date && @booking.end_date < @timeslot.available_end_date
                new_timeslot = Timeslot.new(available_start_date: @timeslot.available_start_date, available_end_date: @booking.start_date - 1, sitter: @timeslot.sitter)
                new_timeslot.save
                @timeslot.update(available_start_date: @booking.end_date + 1)
                @booking.update(status: true)
                @bookings = Booking.where("start_date <= ? or end_date >= ?", @booking.start_date, @booking.end_date)
                @bookings.each do |booking|
                    booking.update(status: false)
                end
            elsif @booking.start_date == @timeslot.available_start_date && @booking.end_date == @timeslot.available_end_date
                @timeslot.destroy
                @booking.update(status: true)
                @bookings = Booking.where("start_date <= ? or end_date >= ?", @booking.start_date, @booking.end_date)
                @bookings.each do |booking|
                    booking.update(status: false)
                end
            else
                render plain: "SOMETHING IS WRONG IN BOOKING UPDATE"
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