# Steps específicos do domínio de filmes.

# HW3 Parte 1: cria os filmes direto no banco via ActiveRecord.
# O Background só precisa do estado inicial; não importa como os filmes chegaram lá.
Given(/^the following movies exist:$/) do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# HW3 Parte 2b: marca/desmarca só as classificações listadas,
# reaproveitando os steps 'I check "..."' e 'I uncheck "..."' do web_steps.rb.
When(/^I (un)?check the following ratings: (.*)$/) do |uncheck, rating_list|
  rating_list.split(",").map(&:strip).each do |rating|
    step %{I #{uncheck}check "ratings_#{rating}"}
  end
end

When(/^I check all ratings$/) do
  Movie::RATINGS.each do |rating|
    step %{I check "ratings_#{rating}"}
  end
end

# HW3 Parte 2c: conta as linhas da tabela e compara com o total de filmes no banco.
Then(/^I should see all of the movies$/) do
  rows = page.all("table#movies tbody tr").size
  expect(rows).to eq(Movie.count)
end

# HW3 Parte 3a: a primeira ocorrência de e1 aparece antes de e2 no HTML.
Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |e1, e2|
  expect(page.body).to include(e1)
  expect(page.body).to include(e2)
  expect(page.body.index(e1)).to be < page.body.index(e2)
end

# HW-BDD: steps declarativos para adicionar filmes pela interface.

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
