require 'rails_helper'

RSpec.describe "sources/index", type: :view do
  before(:each) do
    assign(:sources, [
      Source.create!(
        :name => "Name",
        :type => "Type",
        :url => "Url"
      ),
      Source.create!(
        :name => "Name",
        :type => "Type",
        :url => "Url"
      )
    ])
  end

  it "renders a list of sources" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
