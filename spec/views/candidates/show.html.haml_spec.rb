require 'spec_helper'

describe "candidates/show" do
  before(:each) do
    @candidate = assign(:candidate, stub_model(Candidate,
      :name => "Name",
      :description => "MyText",
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Image Url/)
  end
end
