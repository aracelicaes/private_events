class AttendancesController < ApplicationController
  include UserSessionsHelper
  before_action :set_attendance, only: %i[show edit update destroy]

  def index
    @attendances = Attendance.all
  end

  def attend
    event = Event.find(params[:event_id])

    respond_to do |format|
      if current_user?
        event.attendances.build(user_id: current_user.id)
        event.save
        format.html { redirect_to events_path, notice: 'Purchase went thru successfully!' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { redirect_to event_path(event), alert: 'Please Sign In.' }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id)
  end
end
