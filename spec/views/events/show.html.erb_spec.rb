require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Ical Uid/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Pricing/)
    expect(rendered).to match(/Contact Email/)
    expect(rendered).to match(/Organizer/)
  end
end
