
class Event < ActiveRecord::Base
  belongs_to :source
  serialize :geo, Array

  include PgSearch
  pg_search_scope :search_by_content, against: [:title, :description, :organizer]

end
