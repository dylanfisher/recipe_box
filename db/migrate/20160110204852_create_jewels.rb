class CreateJewels < ActiveRecord::Migration
  def change
    create_table :jewels do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
