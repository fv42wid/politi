require 'spec_helper'

describe "candidates/edit" do
  before(:each) do
    @candidate = assign(:candidate, stub_model(Candidate,
      :name => "MyString",
      :description => "MyText",
      :image_url => "MyString"
    ))
  end

  it "renders the edit candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", candidate_path(@candidate), "post" do
      assert_select "input#candidate_name[name=?]", "candidate[name]"
      assert_select "textarea#candidate_description[name=?]", "candidate[description]"
      assert_select "input#candidate_image_url[name=?]", "candidate[image_url]"
    end
  end
end
