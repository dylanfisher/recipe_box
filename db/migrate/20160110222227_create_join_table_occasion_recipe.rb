class CreateJoinTableOccasionRecipe < ActiveRecord::Migration
  def change
    create_join_table :occasions, :recipes do |t|
      t.index [:occasion_id, :recipe_id]
      t.index [:recipe_id, :occasion_id]
    end
  end
end
