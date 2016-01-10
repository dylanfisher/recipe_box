class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :jewel, index: true, foreign_key: true
      t.belongs_to :color_scheme, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.text :notes
      t.text :acknowledgements

      t.timestamps null: false
    end
  end
end
