class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :save_to_box]

  def index
    @recipes = Recipe.includes(:user).recent
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

  def save_to_box
    @user = current_or_guest_user
    authorize @user

    respond_to do |format|
      if @user.box.recipes.include?(@recipe)
        flash.now[:notice] = 'This recipe is already in your box.'
        format.js { render 'shared/flash_messages' }
      elsif @recipe.user == @user
        flash.now[:notice] = 'This recipe belongs to you; you can\'t add it to your box.'
        format.js { render 'shared/flash_messages' }
      else
        @user.box.recipes << @recipe
      end

      if @user.save
        flash.now[:success] = 'Recipe was added to your box.'
        format.js { render 'shared/flash_messages' }
      else
        flash.now[:error] = 'There was a problem adding this recipe to your box.'
        format.js { render 'shared/flash_messages' }
      end
    end
  end

  private

    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore

      # TODO: Redirect to sign up page
      flash.now[:error] = 'You must sign in before you can add a recipe to your box.'
      respond_to do |format|
        format.js { render 'shared/flash_messages' }
      end
    end
end
