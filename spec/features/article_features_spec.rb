require 'spec_helper'

feature "articles" do
  scenario "can be created by users" do
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