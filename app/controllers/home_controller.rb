class HomeController < ApplicationController

  def index
    skip_authorization
    @recipes = Recipe.all
  end

end
