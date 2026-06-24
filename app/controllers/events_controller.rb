class EventsController < ApplicationController

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: '新しいイベントを始動しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def  show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :desc)
  end
end
