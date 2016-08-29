class SearchController < ApplicationController

  def index
    @query_term = params[:query]
    @query = Recipe.search @query_term, suggest: true, facets: [:seasons_title, :cuisines_title, :meal_types_title, :diets_title, :occasions_title]
    @results = @query.results
    @suggestions = @query.suggestions
  end

end
