class RecipesController < ApplicationController
  def index
    @recipes = Recipe.recent
  end

  def show
    @recipe   = Recipe.friendly.find(params[:id])
    @pairings = @recipe.pairings.randomize
    @user     = @recipe.user
  end
end
