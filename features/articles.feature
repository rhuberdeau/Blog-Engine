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
    And I click the "Save" button
    Then I should see my new article

  Scenario: Users can edit articles
    Given I visit my blog
		And I click the link to an article
		When I click the "Edit" link
		And I edit my article
		Then I should see the edited article
		
	Scenario: Users can add comments to articles
	  Given I visit an article
		And I create a comment
		When I click the "Save" button
		Then I should see my new comment