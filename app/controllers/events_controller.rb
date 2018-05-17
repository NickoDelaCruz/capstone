class EventsController < ApplicationController

  def index
    @events = Event.all
    render :index
  end

  def show
    @event = Event.find(params[:id])
    render :show
  end

  def new
    @event = Event.new
    render :new
 end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to  events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    render :edit
  end

  def update
    @event= Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

private
  def event_params
    params.require(:event).permit(:name, :location, :price, :description)
  end

end
