class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.friendly.find(params[:id])
    @uploaded_recipes  = Recipe.uploaded_by(@user)
    @collected_recipes = Recipe.collected_by(@user)
  end
end
