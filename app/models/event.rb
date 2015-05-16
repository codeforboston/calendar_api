# A calendar event
class Event < ActiveRecord::Base
  belongs_to :source
  serialize :geo, Array
  before_save :ensure_organizer

  include PgSearch
  pg_search_scope :search_by_content, against: [:title,
                                                :description,
                                                :organizer]

  private

  def ensure_organizer
    self.organizer = source.name if organizer.nil?
  end
end
