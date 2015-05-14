require 'rails_helper'

RSpec.describe "sources/edit", type: :view do
  before(:each) do
    @source = assign(:source, Source.create!(
      :name => "MyString",
      :type => "",
      :url => "MyString"
    ))
  end

  it "renders the edit source form" do
    render

    assert_select "form[action=?][method=?]", source_path(@source), "post" do

      assert_select "input#source_name[name=?]", "source[name]"

      assert_select "input#source_type[name=?]", "source[type]"

      assert_select "input#source_url[name=?]", "source[url]"
    end
  end
end
