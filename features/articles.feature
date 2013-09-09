Feature: The blog should consists of a list of articles

  As a website owner
  I want a blog
  So I can create new content

  Background: 
    Given a list of articles

  Scenario: the blog should have a list of articles
	Given I visit my blog
	Then I should see a list of published articles

  Scenario: Users can create a new article
    Given I visit my blog
    And I click the "New Article" link
    When I fill in the article form
    And click the "Publish Article" button
    Then I should see my new article