class CreateColorSchemes < ActiveRecord::Migration
  def change
    create_table :color_schemes do |t|
      t.string :title
      t.string :color

      t.timestamps null: false
    end
  end
end
