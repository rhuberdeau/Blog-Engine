require 'spec_helper'

describe 'article pages' do
  subject { page }
  
  describe "index page" do
    before { visit blog_engine.articles_path }
    
    it { should_not have_link "New Article"}
  end
  
  describe "show page" do
    let(:article) { FactoryGirl.create(:article) }
    before { visit blog_engine.article_path(article) }
    
    it { should_not have_link "Edit" }
  end
  
  describe "authenticated user" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button "Sign in"
    end
    
    describe "visits index page" do
      before { visit blog_engine.articles_path }
      it { should have_link "New Article" }
    end
    
    describe "visits show page" do
      let(:article) { FactoryGirl.create(:article) }
      before { visit blog_engine.article_path(article) }
      it { should have_link "Edit"}
    end
  end
end