class HomeController < ApplicationController

  def index
    skip_authorization
    @random_recipes = Recipe.random.limit(3)
    @featured_recipe = Recipe.with_image.random.where.not(id: @random_recipes.collect(&:id)).limit(1).first
    @recently_uploaded_recipes = Recipe.updated_at_desc.limit(4).shuffle
  end

end
