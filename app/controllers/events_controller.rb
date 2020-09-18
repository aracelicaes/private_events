class EventsController < ApplicationController
  include UserSessionsHelper
  before_action :set_event, only: :show

  def index
    @events = Event.all
    @future_events = @events.upcoming_events
    @past_events = @events.past_events
  end

  def show
    @event_attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    respond_to do |format|
      @event = current_user.hosted_events.build(event_params) if current_user?

      if @event.save
        @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
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
