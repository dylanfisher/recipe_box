class SearchController < ApplicationController

  def index
    @query_term = params[:query]
    @query = nil
    @results = []
    @suggestions = []
  end

end
