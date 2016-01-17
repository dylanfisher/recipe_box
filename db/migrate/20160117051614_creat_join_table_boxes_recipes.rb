class CreatJoinTableBoxesRecipes < ActiveRecord::Migration
  def change
    create_join_table :boxes, :recipes do |t|
      t.index [:box_id, :recipe_id]
      t.index [:recipe_id, :box_id]
    end
  end
end
