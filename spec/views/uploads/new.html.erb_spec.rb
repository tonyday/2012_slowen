require 'spec_helper'

describe "uploads/new" do
  before(:each) do
    assign(:upload, stub_model(Upload,
      :file_name => "MyString",
      :contents => "MyText",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new upload form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => uploads_path, :method => "post" do
      assert_select "input#upload_file_name", :name => "upload[file_name]"
      assert_select "textarea#upload_contents", :name => "upload[contents]"
      assert_select "input#upload_user_id", :name => "upload[user_id]"
    end
  end
end
