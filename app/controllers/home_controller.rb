class HomeController < ApplicationController

  def index
    skip_authorization
    @recipes = Recipe.recent.limit(4)
    @featured_recipe = Recipe.random.limit(1).first
    @recently_uploaded_recipes = Recipe.recent.limit(4).shuffle
  end

end
