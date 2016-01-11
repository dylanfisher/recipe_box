class AddReferencesToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :recipe_id, :integer
    add_column :boxes, :user_id, :integer
  end
end
