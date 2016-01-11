class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
