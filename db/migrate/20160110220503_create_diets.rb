class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
