require 'spec_helper'

describe 'admin pages' do
  subject { page }
  
  describe "authenticated user" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      5.times { FactoryGirl.create(:article, published: false) }
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button "Sign in"
    end
    
    describe "visits index page" do
      before { visit '/blog/admin' }
      specify { all('.unpublished-article').length.should eq(5) }
    end
    
  end
end