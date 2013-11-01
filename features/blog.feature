Feature: The blog should consists of a list of articles

  As a website owner
  I want a blog
  So I can create new content

  Background: 
    Given a list of articles
		Given a user exists

  Scenario: the blog should have a list of articles
	  Given I visit my blog
	  Then I should see a list of published articles

  Scenario: Authenticated users can create a new article
    Given I sign in
		And I visit my blog
    And I click the "New Article" link
    When I fill in the article form
    And I click the "Save" button
    Then I should see my new article

  Scenario: Authenticated users can edit articles
    Given I sign in
		And I visit my blog
		And I click the link to an article
		When I click the "Edit" link
		And I edit my article
		Then I should see the edited article
		
	Scenario: Authenticated users can publish unpublished articles
	  Given I sign in
	  And I visit the admin page
	  And I check all the unpublished articles
	  When I click the "Publish Articles" button
	  Then I should see "Published"
	  And I should not see any unpublished articles
	
	Scenario: Blog articles should be paginated
	  Given I have 2 pages of articles 
		When I visit my blog
	  Then I should see pagination links
		And I should only see page 1 of the articles
		
		When I click the "2" link
		Then I should see page 2 of the articles