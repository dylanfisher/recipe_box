class CreateJoinTableMealTypeRecipe < ActiveRecord::Migration
  def change
    create_join_table :meal_types, :recipes do |t|
      t.index [:meal_type_id, :recipe_id]
      t.index [:recipe_id, :meal_type_id]
    end
  end
end
