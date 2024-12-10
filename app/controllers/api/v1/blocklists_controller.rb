module Api
  module V1
      class BlocklistsController < ApplicationController
        before_action :set_blocklist_id, only: [:show, :destroy]
        before_action :authenticate_user!
        def index
          @user_blocklist = current_user.blocklists.all
          if !@user_blocklist
            render json: { message: "Empty" }, status: :no_content
          else
            render json: @user_blocklist, status: :ok
          end
        end
  
        def show
          @user_blocklist = current_user.blocklists.find_by(params[:id])
          if !@user_blocklist
            render json: { message: "nothing here, add domain here" }, status: :no_content
          else
            render json: @user_blocklist, status: :ok
          end
        end

        def create
          # Check if the domain already exists
          existing_blocklist = current_user.blocklists.find_by(domain: blocklist_params[:domain])
      
          if existing_blocklist
            render json: { error: "Domain already exists in your blocklist" }, status: :unprocessable_entity
          else
            @blocklist = current_user.blocklists.new(blocklist_params)
      
            if @blocklist.save
              render json: @blocklist, status: :created
            else
              render json: { error: "Domain wasn't added", message: @blocklist.errors.full_messages }, status: :unprocessable_entity
            end
          end
        end
  
        def destroy
          if @user_blocklist 
            @user_blocklist.destroy
            render json: { message: "Domain removed"}, status: :ok
          else
            render json: { message: @user_blocklist.errors.message }, status: :unprocessable_entity
          end
        end
  
      private
  
      def set_blocklist_id
        @user_blocklist = current_user.blocklists.find_by(params[:id])
      end
  
      def blocklist_params
        params.expect(blocklist: [:domain])
      end
    end
  end
end