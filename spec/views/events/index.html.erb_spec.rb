require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :source_id => 1,
        :icaluid => "Ical Uid",
        :start_date => "",
        :end_date => "",
        :title => "Title",
        :description => "MyText",
        :url => "Url",
        :pricing => "Pricing",
        :contact_email => "Contact Email",
        :organizer => "Organizer"
      ),
      Event.create!(
        :source_id => 1,
        :icaluid => "Ical Uid",
        :start_date => "",
        :end_date => "",
        :title => "Title",
        :description => "MyText",
        :url => "Url",
        :pricing => "Pricing",
        :contact_email => "Contact Email",
        :organizer => "Organizer"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Ical Uid".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Pricing".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Email".to_s, :count => 2
    assert_select "tr>td", :text => "Organizer".to_s, :count => 2
  end
end
