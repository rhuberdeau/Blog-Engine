Given(/^a list of articles$/) do
  BlogEngine::Article.create(title: "hello world", content: "how are you",     published: true)
  BlogEngine::Article.create(title: "second post", content: "going ok so far", published: false)
  BlogEngine::Article.create(title: "no publish" , content: "doesn't matter",  published: false)
end

Given(/^a user exists$/) do
  @user = FactoryGirl.create(:user)
end

When(/^I visit my blog$/) do
  visit '/blog/articles'
end

Given(/^I sign in$/) do
  visit '/signin'
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: @user.password
  click_button "Sign in"
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

When(/^I fill in the article form$/) do
  page.fill_in 'article_title', with: "my brand new article"
  page.fill_in 'article_content', with: "this is the article content"
  page.check 'article_published'
end

When(/^I click the "(.*?)" button$/) do |button_name|
  page.click_button(button_name)
end

Then(/^I should see my new article$/) do
  within('.article') do
    page.should have_content "this is the article content"
  end
end

Given(/^I click the link to an article$/) do
  page.click_link "hello world"
end

When(/^I edit my article$/) do
  page.find("#article_title").click
  fill_in 'article_title', with: "the edited article title"
  page.click_button "Save"
end

Then(/^I should see the edited article$/) do
  within('.article') do
    page.should have_selector( 'h1', text: "the edited article title" )
  end
end

Given(/^I visit an article$/) do
  visit '/blog/articles'
  page.click_link "hello world"
end

Given(/^I create a comment$/) do
  fill_in 'comment_content', with: 'my new comment'
end

Then(/^I should see my new comment$/) do
  within('.comments') do
    page.should have_content "my new comment"
  end
end

Given(/^I visit the admin page$/) do
  visit '/blog/admin'
end

Then(/^I should see "(.*?)"$/) do |words|
  page.should have_content words
end

Given(/^I check all the unpublished articles$/) do
  page.all('.publish').length.should eq(2)
  page.all("input[type='checkbox']").each { |box| box.set(true) }
end

Then(/^I should not see any unpublished articles$/) do
  page.should have_css('h1', text: 'Admin Page')
  page.all('.publish').length.should eq(0)
end

Given(/^I have (\d+) pages of articles$/) do |number_of_pages|
  number_of_pages = number_of_pages.to_i * 5
  expect(number_of_pages).to equal(10)
  number_of_pages.times do |n|
    BlogEngine::Article.create(title: "article number #{n}", content: "how are you",     published: true)
  end
end

Then(/^I should see pagination links$/) do
  page.should have_link("1")
  page.should have_link("2")
end

Then(/^I should only see page (\d+) of the articles$/) do |page_number|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see page (\d+) of the articles$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I click the "(.*?)" link$/) do |link_name|
  page.click_link(link_name)
end

