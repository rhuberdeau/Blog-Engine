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
      @comment = FactoryGirl.create(:comment, content: "What a wonderful blog", article_id: @article.id)
    end
    it "cannot create comments" do
      visit '/blog/articles'
      click_link @article.title
      fill_in 'comment_content', with: 'my new comment'
      click_button 'Save'
      page.should_not have_content "Your comment has been created"
      page.should have_field 'user_email'
    end
  end
end