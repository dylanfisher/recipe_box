class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :title
      t.string :amount
      t.integer :position
      t.belongs_to :recipe, index: true, foreign_key: true

      t.index [:recipe_id, :position]

      t.timestamps null: false
    end
  end
end
