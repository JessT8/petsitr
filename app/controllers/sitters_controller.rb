class SittersController < ApplicationController

      def index
        @sitter = Sitter.all()
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
        @sitter = Sitter.find(params[:id])
      end
    
      def destroy
        @sitter = Sitter.find(params[:id])
      end

end