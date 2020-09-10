class AttendancesController < ApplicationController
  include UserSessionsHelper
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = Attendance.all
  end

  # GET/attendances/buy/:event_id
  def buy
    event = Event.find(params[:event_id])

    # unless current_user.nil?
    # event.attendances.build(user_id: current_user.id)
    # else
    #   redirect_to event_path(event)
    # end
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

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    # @attendance = Attendance.new
    # @attendance.user_id = current_user.id
    # attendance.event_id = @event.id
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
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

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
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

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:user_id, :event_id)
    end
end
