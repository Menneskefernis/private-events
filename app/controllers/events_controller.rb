class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "A new event was added"
      redirect_to profile_path
    else
      flash[:warning] = "Couldn't add event"
      redirect_to profile_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
    @invitees = User.invitees(current_user)
  end

  private
    def event_params
      params.require(:event).permit(:description, :location, :date)
    end
end
