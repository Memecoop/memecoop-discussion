require 'spec_helper'

describe "topics/new.html.erb" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :title => "MyString",
      :description => "MyText",
      :creator_id => 1
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path, :method => "post" do
      assert_select "input#topic_title", :name => "topic[title]"
      assert_select "textarea#topic_description", :name => "topic[description]"
      assert_select "input#topic_creator_id", :name => "topic[creator_id]"
    end
  end
end
