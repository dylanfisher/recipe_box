class RemoveRecipeIdFromBoxes < ActiveRecord::Migration
  def change
    remove_column :boxes, :recipe_id, :integer
  end
end
