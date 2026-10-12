# Traduz nomes de páginas usados nos cenários ("the RottenPotatoes home page")
# para as rotas reais da aplicação.
module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /^the RottenPotatoes home page$/ then movies_path
    when /^the Create New Movie page$/ then new_movie_path
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" \
            "Add the mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
