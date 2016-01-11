class DropJoinTableBoxRecipe < ActiveRecord::Migration
  def up
    drop_table :boxes_recipes
  end

  def down
    create_join_table :boxes, :recipes do |t|
      t.index [:box_id, :recipe_id]
      t.index [:recipe_id, :box_id]
    end
  end
end
