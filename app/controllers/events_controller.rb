class EventsController < InheritedResources::Base

  respond_to :json

  def search
    # create an empty set
    @events = Event.where(nil)
    @events = Event.search_by_content( URI.unescape(params[:q])) if params[:q].present?
  end

  def index
    @events = Event.all
  end

  private

    def event_params
      params.require(:event).permit(:source_id, :icaluid, :start_date, :end_date, :title, :description, :url, :pricing, :contact_email, :organizer)
    end
end

