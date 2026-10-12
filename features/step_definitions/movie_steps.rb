# Steps específicos do domínio de filmes.

# Verifica a ordem: a primeira ocorrência de e1 aparece antes de e2 no HTML.
Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |e1, e2|
  expect(page.body).to include(e1)
  expect(page.body).to include(e2)
  expect(page.body.index(e1)).to be < page.body.index(e2)
end

# Steps declarativos: descrevem o "quê" e escondem o "como" (os cliques na UI).

Given(/^I have added a movie with title "([^"]*)" and rating "([^"]*)"$/) do |title, rating|
  visit new_movie_path
  fill_in "Title", with: title
  select rating, from: "Rating"
  click_button "Save Changes"
  expect(URI.parse(current_url).path).to eq(movies_path)
end

When(/^I view the movie list sorted by title$/) do
  visit movies_path
  click_link "Movie Title"
end
