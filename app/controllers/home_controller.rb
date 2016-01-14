class HomeController < ApplicationController

  def index
    skip_authorization
    @recipes = Recipe.recent.limit(4)
  end

end
