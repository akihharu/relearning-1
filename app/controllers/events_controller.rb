class EventsController < ApplicationController

  def new
    @event = Event.new
  end
  
  def index
    @events = Event.all
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path, notice: 'イベントを削除しました'
  end

  private

  def event_params
    params.require(:event).permit(:title, :desc)
  end
end
