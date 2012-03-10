require 'spec_helper'

describe "Welcome page" do

  it "should have the content 'Welcome to Slowen'" do
    visit '/welcome/index'
    page.should have_content('Welcome to Slowen')
  end

end
