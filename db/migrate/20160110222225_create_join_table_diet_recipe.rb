class CreateJoinTableDietRecipe < ActiveRecord::Migration
  def change
    create_join_table :diets, :recipes do |t|
      t.index [:diet_id, :recipe_id]
      t.index [:recipe_id, :diet_id]
    end
  end
end
