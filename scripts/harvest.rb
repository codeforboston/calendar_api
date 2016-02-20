#!/usr/bin/env ruby
require 'icalendar'
require 'net/http'

ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../../config/environment', __FILE__)

sources = Source.where(approved: true)


def create_or_update_event(icaluid, attributes)

  # create a new event or update an existing one
  puts icaluid
  puts attributes

  event = Event.where(icaluid: icaluid).first_or_initialize
  event.update(attributes)
  puts "Updated #{attributes[:title]}"
  event.save
  puts event.errors.full_messages

end


def harvest_events(source)

  puts "\nHarvesting Events from source: \"#{source.name}\" (#{source.url})..."


  puts "\nFetch source from URL"
  begin
    uri = URI source.url
    response = Net::HTTP.get uri
  rescue StandardError => e
    puts "\nError fetching source, flagging #{source.name} to be un-approved due to errors: "
    puts e
    source.approved = false
    source.notes << "\n#{e}"
    source.save
    false
  end

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
      }

      create_or_update_event(event.uid.to_s, attributes)

    end
  end

end



sources.each do |source|
  harvest_events(source)
end
