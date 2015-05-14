class EventsController < InheritedResources::Base

  private

    def event_params
      params.require(:event).permit(:source_id, :icaluid, :start_date, :end_date, :title, :description, :url, :pricing, :contact_email, :organizer)
    end
end

