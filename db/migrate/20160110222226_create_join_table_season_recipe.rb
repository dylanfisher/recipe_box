class CreateJoinTableSeasonRecipe < ActiveRecord::Migration
  def change
    create_join_table :seasons, :recipes do |t|
      t.index [:season_id, :recipe_id]
      t.index [:recipe_id, :season_id]
    end
  end
end
