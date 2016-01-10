require 'test_helper'

class Admin::RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { acknowledgements: @recipe.acknowledgements, color_scheme_id: @recipe.color_scheme_id, description: @recipe.description, featured_image: @recipe.featured_image, jewel_id: @recipe.jewel_id, notes: @recipe.notes, title: @recipe.title, user_id: @recipe.user_id }
    end

    assert_redirected_to admin_recipe_path(assigns(:recipe))
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    patch :update, id: @recipe, recipe: { acknowledgements: @recipe.acknowledgements, color_scheme_id: @recipe.color_scheme_id, description: @recipe.description, featured_image: @recipe.featured_image, jewel_id: @recipe.jewel_id, notes: @recipe.notes, title: @recipe.title, user_id: @recipe.user_id }
    assert_redirected_to admin_recipe_path(assigns(:recipe))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to admin_recipes_path
  end
end
