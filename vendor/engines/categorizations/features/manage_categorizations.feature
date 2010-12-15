@categorizations
Feature: Categorizations
  In order to have categorizations on my website
  As an administrator
  I want to manage categorizations

  Background:
    Given I am a logged in refinery user
    And I have no categorizations

  @categorizations-list @list
  Scenario: Categorizations List
   Given I have categorizations titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of categorizations
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @categorizations-valid @valid
  Scenario: Create Valid Categorization
    When I go to the list of categorizations
    And I follow "Add New Categorization"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 categorization

  @categorizations-invalid @invalid
  Scenario: Create Invalid Categorization (without name)
    When I go to the list of categorizations
    And I follow "Add New Categorization"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 categorizations

  @categorizations-edit @edit
  Scenario: Edit Existing Categorization
    Given I have categorizations titled "A name"
    When I go to the list of categorizations
    And I follow "Edit this categorization" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of categorizations
    And I should not see "A name"

  @categorizations-duplicate @duplicate
  Scenario: Create Duplicate Categorization
    Given I only have categorizations titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of categorizations
    And I follow "Add New Categorization"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 categorizations

  @categorizations-delete @delete
  Scenario: Delete Categorization
    Given I only have categorizations titled UniqueTitleOne
    When I go to the list of categorizations
    And I follow "Remove this categorization forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 categorizations
 