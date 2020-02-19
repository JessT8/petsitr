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
        @sitter = Sitter.new(params[:Sitter])
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

end