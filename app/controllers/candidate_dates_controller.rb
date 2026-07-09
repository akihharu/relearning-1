class CandidateDatesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @candidate_date = @event.candidate_dates.build(candidate_date_parmas)
    if @candidate_date.save
      redirect_to @event
    end
  end

  def destroy
    @candidate_date = CandidateDate.find(params[:id])
    @candidate_date.destroy
    redirect_to @candidate_date.event
  end

private

  def candidate_date_params
    params.require(:candidate_date).permit(:date)
  end
end

