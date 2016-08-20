class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :save_to_box, :edit, :update, :destroy]

  def index
    @recipes = Recipe.includes(:user).recent
  end

  def show
    @recipe   = Recipe.friendly.find(params[:id])
    @pairings = @recipe.pairings.random
    @user     = @recipe.user

    if !Rails.cache.exist?([@recipe, @user])
      Rails.cache.write([@recipe, @user], render_to_string(pdf: "#{@recipe.title} - #{Date.today.to_s}", template: 'recipes/pdf.html.erb', layout: 'pdf.html'))
    end

    respond_to do |format|
      format.html
      format.pdf do
        render text: Rails.cache.read([@recipe, @user])
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

  # GET /recipes/new
  def new
    authorize @user
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    @user = @recipe.user
    authorize @user
    @pairings = @recipe.pairings.random
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user if current_user
    authorize @user

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
      policy_name = exception.policy.class.to_s.underscore

      # TODO: Redirect to sign up page
      flash.now[:error] = "You must #{view_context.link_to('sign in', new_user_session_path, class: 'link')} before you can add a recipe to your box."
      respond_to do |format|
        format.js { render 'shared/flash_messages' }
      end
    end
end
