class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def index
  end

  def show
  end

  private

    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end
end
