Feature: View movie list sorted by title

  As a movie fan
  So that I can quickly find a movie
  I want to see the movie list sorted alphabetically by title

Scenario: View movie list after adding 2 movies (imperative)
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Zorro"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Apocalypse Now"
  And I select "R" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  When I follow "Movie Title"
  Then I should see "Apocalypse Now" before "Zorro"

Scenario: View movie list after adding 2 movies (declarative)
  Given I have added a movie with title "Zorro" and rating "PG"
  And I have added a movie with title "Apocalypse Now" and rating "R"
  When I view the movie list sorted by title
  Then I should see "Apocalypse Now" before "Zorro"
