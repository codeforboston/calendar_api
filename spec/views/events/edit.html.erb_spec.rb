require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :source_id => 1,
      :icaluid => "MyString",
      :start_date => "",
      :end_date => "",
      :title => "MyString",
      :description => "MyText",
      :url => "MyString",
      :pricing => "MyString",
      :contact_email => "MyString",
      :organizer => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_source_id[name=?]", "event[source_id]"

      assert_select "input#event_icaluid[name=?]", "event[icaluid]"

      assert_select "input#event_start_date[name=?]", "event[start_date]"

      assert_select "input#event_end_date[name=?]", "event[end_date]"

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "input#event_url[name=?]", "event[url]"

      assert_select "input#event_pricing[name=?]", "event[pricing]"

      assert_select "input#event_contact_email[name=?]", "event[contact_email]"

      assert_select "input#event_organizer[name=?]", "event[organizer]"
    end
  end
end
