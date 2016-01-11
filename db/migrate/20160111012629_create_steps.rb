class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :description
      t.integer :position
      t.belongs_to :recipe, index: true, foreign_key: true

      t.index [:recipe_id, :position]

      t.timestamps null: false
    end
  end
end
