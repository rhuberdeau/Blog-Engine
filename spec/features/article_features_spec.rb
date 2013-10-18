require 'spec_helper'

describe "articles" do
  context "signed in" do
    let(:user)  { FactoryGirl.create(:user) }
    it "can create articles" do
      visit '/signin'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button "Sign in"
      
      visit '/blog/articles'
      click_link "New Article"
      fill_in 'article_title', with: "my brand new article"
      fill_in 'article_content', with: "this is the article content"
      check 'article_published'
      click_button "Save"
      within('.article') do
        page.should have_content "this is the article content"
      end
    end
  end
  
  context "not signed in" do
    before do
      @article = FactoryGirl.create(:article, title: "this is a brand new post", content: "what have things come to?")
    end
  end
end