Given(/^a list of articles$/) do
  BlogEngine::Article.create(title: "hello world", content: "how are you", published: true)
  BlogEngine::Article.create(title: "second post", content: "going ok so far", published: false)
end

When(/^I visit my blog$/) do
  visit '/blog/articles'
end

Then(/^I should see a list of published articles$/) do
  page.should have_content("hello world")
  page.should_not have_content("going ok so far")
end

Given(/^I visit an unpublished article$/) do
  @article = BlogEngine::Article.create(title: "hello world", content: "how are you", published: false)
  visit '/blog/articles'
  page.click_link 'hello world'
end

Then(/^I should be redirected to the index$/) do
  page.should_not have_selector('h1', 'hello world')
end

Given(/^I click the "(.*?)" link$/) do |link_name| 
  page.click_link link_name
end

When(/^I fill in the article form$/) do
  page.fill_in 'article_title', with: "my brand new article"
  page.fill_in 'article_content', with: "this is the article content"
  page.check 'article_published'
end

When(/^click the "(.*?)" button$/) do |button_name|
  page.click_button(button_name)
end

Then(/^I should see my new article$/) do
  within('.article') do
    page.should have_content "this is the article content"
  end
end

