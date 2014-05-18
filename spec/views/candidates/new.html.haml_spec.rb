require 'spec_helper'

describe "candidates/new" do
  before(:each) do
    assign(:candidate, stub_model(Candidate,
      :name => "MyString",
      :description => "MyText",
      :image_url => "MyString"
    ).as_new_record)
  end

  it "renders new candidate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", candidates_path, "post" do
      assert_select "input#candidate_name[name=?]", "candidate[name]"
      assert_select "textarea#candidate_description[name=?]", "candidate[description]"
      assert_select "input#candidate_image_url[name=?]", "candidate[image_url]"
    end
  end
end
