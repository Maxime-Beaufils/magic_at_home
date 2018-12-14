class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
    @event = Event.new
    @all_event = Event.where("start >= ?", Time.current).order('start ASC').page(params[:page]).per(1)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    
    @event = Event.create('title' => params.require(:event)[:title],
                          'date_range' => params.require(:event)[:date],
                          'description' => params.require(:event)[:description],
                          'start' => params.require(:event)[:start],
                          'end' => params.require(:event)[:end],
                          'place' => params.require(:event)[:place],
                          'user_event_creator_id' => current_user.id)
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
    end
end
