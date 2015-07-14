class EventsController < InheritedResources::Base

  respond_to :json

  def search
    # create an empty set
    @events = Event.where(nil)

    if params[:q].present?
      @events = Event.search_by_content(URI.unescape(params[:q]))
    end

    @events = date_filter(@events, params)
    @events = paginate(@events, params)

  end

  def index
    @events = Event.all
    @events = date_filter(@events, params)
    @events = paginate(@events, params)
  end

  private

    def event_params
      params.require(:event).permit(:source_id, :icaluid, :start_date, :end_date, :title, :description, :location, :url, :pricing, :contact_email, :organizer)
    end

    def date_filter(events, params)
      if params[:start_date].present? || params[:end_date].present?
        # parse start & end dates
        start_date = Date.strptime(params[:start_date], '%m-%d-%Y') if params[:start_date].present?

        end_date = Date.strptime(params[:end_date], '%m-%d-%Y') if params[:end_date].present?

        events.filter_by_date(start_date: start_date,
                              end_date: end_date)
      else
        # otherwise pass through
        events
      end
    end

    def paginate(events, params)
      events.paginated(page: params[:page], per_page: params[:per_page])
    end
end

