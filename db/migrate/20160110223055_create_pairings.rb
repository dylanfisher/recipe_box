class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|

      t.timestamps null: false
    end
  end
end
