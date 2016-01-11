class Admin::RecipesController < Admin::ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /admin/recipes
  # GET /admin/recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /admin/recipes/1
  # GET /admin/recipes/1.json
  def show
  end

  # GET /admin/recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /admin/recipes/1/edit
  def edit
  end

  # POST /admin/recipes
  # POST /admin/recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user if current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to [:admin, @recipe], notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/recipes/1
  # PATCH/PUT /admin/recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to [:admin, @recipe], notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/recipes/1
  # DELETE /admin/recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to admin_recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title,
                                     :description,
                                     :notes,
                                     :acknowledgements,
                                     :featured_image,
                                     :user_id,
                                     :jewel_id,
                                     :color_scheme_id,
                                     :cuisine_ids => [],
                                     :meal_type_ids => [],
                                     :diet_ids => [],
                                     :season_ids => [],
                                     :occasion_ids => [],
                                     :recipe_ids => [],
                                     :box_ids => [],)
    end
end
