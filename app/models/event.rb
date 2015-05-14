class Event < ActiveRecord::Base
  belongs_to :source
  serialize :geo, Array
end
