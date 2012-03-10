require 'spec_helper'

describe "Welcome page" do

  subject { page }

  describe 'for non signed-in users' do
    before { visit '/welcome/index' }
    it { should have_selector('title', text: 'Sign in') }
    it { should have_selector('div.flash.notice', text: 'Please sign in.') }
  end

end
