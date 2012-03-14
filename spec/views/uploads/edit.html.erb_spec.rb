require 'spec_helper'

describe "uploads/edit" do
  before(:each) do
    @upload = assign(:upload, stub_model(Upload,
      :file_name => "MyString",
      :contents => "MyText",
      :user_id => 1
    ))
  end

  it "renders the edit upload form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => uploads_path(@upload), :method => "post" do
      assert_select "input#upload_file_name", :name => "upload[file_name]"
      assert_select "textarea#upload_contents", :name => "upload[contents]"
      assert_select "input#upload_user_id", :name => "upload[user_id]"
    end
  end
end
