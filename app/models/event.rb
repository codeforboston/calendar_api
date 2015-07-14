# A calendar event
class Event < ActiveRecord::Base
  belongs_to :source
  before_save :ensure_organizer

  include PgSearch
  pg_search_scope :search_by_content, against: [:title,
                                                :description,
                                                :organizer]


  def self.paginated(opts = {})
    page = opts[:page]
    per_page = opts[:per_page]
    event = Event.arel_table
    if page && per_page
      self.paginate(page: page, per_page: per_page)
    else
      self.all
    end
  end

  def self.filter_by_date(opts = {})
    start_date = opts[:start_date]
    end_date = opts[:end_date]
    event = Event.arel_table

    if start_date && end_date
      self.where(event[:start_date].gt(start_date))
        .where(event[:end_date].lt(end_date))
    elsif start_date && !end_date
      self.where(event[:start_date].gt(start_date))
    elsif !start_date && end_date
      self.where(event[:end_date].gt(end_date))
    else
      self.all
    end
  end


  private

  def ensure_organizer
    self.organizer = source.name if organizer.nil?
  end
end
