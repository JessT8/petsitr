class SittersController < ApplicationController

      def index
        @sitter = Sitter.all()
      end
      
      def profile
        @sitter = Sitter.find_by(user: current_user)
        if @sitter
        else 
          redirect_to new_profile_path
        end
      end

      def new
      end

      def show
        @sitter = Sitter.find(params[:id])
      end
    
      def create
        @sitter = Sitter.new(sitter_params)
        @sitter.user = current_user

        # empty checkboxes are not sent, therefore nil
        if !@sitter.is_visible
          @sitter.is_visible = false
        end
        
        @sitter.save

        redirect_to profile_path
      end
    
      def update
        @sitter = Sitter.find(params[:id])
      end
    
      def edit
        @sitter = Sitter.find_by(user: current_user)
      end
    
      def destroy
        @sitter = Sitter.find(params[:id])
      end

      private

      def sitter_params
        params.require(:sitter).permit(:phone, :location, :price, :about, :picture, :is_visible)
      end

end