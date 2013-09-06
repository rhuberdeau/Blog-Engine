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