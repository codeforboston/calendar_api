#!/usr/bin/env ruby
require 'icalendar'
require 'net/http'

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)

sources = Source.all


def create_or_update_event(icaluid, attributes)

  # create a new event or update an existing one
  puts icaluid
  puts attributes

  Event.where(icaluid: icaluid).first_or_initialize do |event|
    event.update(attributes)
    puts "Updated #{attributes[:title]}"
    event.save
  end


end


def harvest_events(source)

  puts "\nHarvesting Events from source: \"#{source.name}\" (#{source.url})..."

  uri = URI source.url
  response = Net::HTTP.get uri
  cals = Icalendar.parse response

  puts "Found #{cals.count} calendar(s)..."

  cals.each do |cal|

    puts "There are #{cal.events.count} events in this calendar"

    cal.events.each do |event|

      puts "\t#{event.summary}"

      attributes = {
        source: source,
        icaluid: event.uid,
        start_date: event.dtstart,
        end_date: event.dtend,
        title: event.summary,
        description: event.description,
        url: event.url,
        location: event.location
        # geo: event.geo.to_a
      }

      create_or_update_event(event.uid.to_s, attributes)

    end
  end

end



sources.each do |source|
  harvest_events(source)
end
