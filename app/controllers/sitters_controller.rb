class SittersController < ApplicationController
  before_action :authenticate_user!

      def index
        @sitters = Sitter.where(:is_visible => true).where.not(:user => current_user)
      end

      def profile
        @sitter = Sitter.find_by(user: current_user)
        if @sitter
        else
          redirect_to new_profile_path
        end
      end

      def new
        @pets = Pet.all
      end

      def show
        @sitter = Sitter.find(params[:id])
      end

      def create
        @sitter = Sitter.new(sitter_params)
        @timeslot = Timeslot.new(timeslot_params)
        @sitter.user = current_user

        # empty checkboxes are not sent, therefore nil
        if !@sitter.is_visible
          @sitter.is_visible = false
        end

        if @sitter.save
          @timeslot.sitter = current_user.sitter
          if @timeslot.save
            redirect_to profile_path
          else
            @pets = Pet.all
            render 'new'
          end
        else
          @pets = Pet.all
          render 'new'
        end
      end

      def edit
        @sitter = Sitter.find_by(user: current_user)
        if @sitter
          @pets = Pet.all
          @timeslots = Timeslot.where(sitter: current_user.sitter)
        else
          redirect_to new_profile_path
        end
      end

      def update
        @sitter = Sitter.find_by(user: current_user)
        if !sitter_params[:is_visible]
          @sitter.is_visible = false
          @sitter.update(sitter_params)
        else
          @sitter.update(sitter_params)
        end

        redirect_to profile_path
      end

      def destroy
        @sitter = Sitter.find(params[:id])
      end

      private

      def sitter_params
        params.require(:sitter).permit(:phone, :description, :location, :price, :about, :picture, :is_visible, :pet_ids=>[])
      end

      def timeslot_params
        params.require(:sitter).permit(:available_start_date, :available_end_date)
      end

end