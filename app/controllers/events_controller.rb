class EventsController < ApplicationController
  include UserSessionsHelper
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.all
    @future_events = @events.upcoming_events
    @past_events = @events.past_events
  end

  def show
    @event = Event.find(params[:id])
    @event_attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    respond_to do |format|
      if current_user?
        @event = current_user.events.build(event_params)
        @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to events_path, notice: 'Please Sign In.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :location, :description)
  end
end
