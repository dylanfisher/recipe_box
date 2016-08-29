class SearchController < ApplicationController

  def index
    @query_term = params[:query]
    @query = Recipe.search(@query_term)
  end

end
