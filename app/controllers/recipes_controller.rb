class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :save_to_box, :edit, :update, :destroy]

  def index
    @recipes = Recipe.includes(:user).updated_at_desc
  end

  def show
    @recipe   = Recipe.friendly.find(params[:id])
    @pairings = @recipe.pairings.random
    @user     = @recipe.user
  end

  def save_to_box
    authorize @recipe
    @user = current_or_guest_user

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

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  # GET /recipes/1/edit
  def edit
    authorize @recipe
    @pairings = @recipe.pairings.random
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe
    @recipe.user = current_user if current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    authorize @recipe

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    authorize @recipe

    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    def user_not_authorized(exception)
      # policy_name = exception.policy.class.to_s.underscore

      # TODO: Redirect to sign up page
      flash.now[:error] = "You must #{view_context.link_to('sign in', new_user_session_path, class: 'link')} before you can add a recipe to your box."
      respond_to do |format|
        format.html { redirect_to @recipe, flash: {
          error: not_authorized_to_edit_flash_error }
        }
        format.js { render 'shared/flash_messages' }
      end
    end

    def not_authorized_to_edit_flash_error
      if current_user
        "You don't have permission to edit that recipe."
      else
        "You must #{view_context.link_to('sign in', new_user_session_path, class: 'link')} before you can edit a recipe."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title,
                                     :description,
                                     :notes,
                                     :acknowledgements,
                                     :preparation_time,
                                     :featured_image,
                                     :user_id,
                                     :jewel_id,
                                     :color_scheme_id,
                                     :cuisine_ids => [],
                                     :meal_type_ids => [],
                                     :diet_ids => [],
                                     :season_ids => [],
                                     :occasion_ids => [],
                                     :pairing_ids => [],
                                     :box_ids => [],
                                     steps_attributes: [:id, :_destroy, :position, :description],
                                     ingredients_attributes: [:id, :_destroy, :position, :title, :amount],)
    end
end
