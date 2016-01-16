class RecipesController < ApplicationController
  def index
    @recipes = Recipe.recent
  end

  def show
    @recipe   = Recipe.friendly.find(params[:id])
    @pairings = @recipe.pairings.randomize
    @user     = @recipe.user

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@recipe.title} - #{Date.today.to_s}",
               template: 'recipes/pdf.html.erb',
               layout: 'pdf.html'
      end
    end
  end
end
