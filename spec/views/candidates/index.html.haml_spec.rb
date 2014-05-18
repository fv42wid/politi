require 'spec_helper'

describe "candidates/index" do
  before(:each) do
    assign(:candidates, [
      stub_model(Candidate,
        :name => "Name",
        :description => "MyText",
        :image_url => "Image Url"
      ),
      stub_model(Candidate,
        :name => "Name",
        :description => "MyText",
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of candidates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end
