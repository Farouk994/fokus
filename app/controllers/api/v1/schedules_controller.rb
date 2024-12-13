class Api::V1::SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_schedule_id

  def index
    @user_schedule = current_user.schedule.all
    if !@user_schedule
      render json: { message: "No schedules available for #{current_user.id}"}
    else
      render json: @user_schedule
    end
  end

  def show
    if @user_schedule
      render json: @user_schedule, status: :ok
    else
      render json: { message: "Unknown User Schedule"}, status: :not_found
    end
  end

  # def create
  #   existing_schedule = current_user.find
  #   @user_schedule = current_user.find_by(schedule_params)
  # end

  def destroy
  end

  private

  def set_user_schedule_id
    @user_schedule = current_user.schedules.find_by(params[:id])
  end

  def schedule_params
    params.expect(schedules: [:start_time, :end_time, :days])
  end

end