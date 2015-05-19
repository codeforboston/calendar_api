# A calendar event
class Event < ActiveRecord::Base
  belongs_to :source
  serialize :geo, Array
  before_save :ensure_organizer

  include PgSearch
  pg_search_scope :search_by_content, against: [:title,
                                                :description,
                                                :organizer]


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
