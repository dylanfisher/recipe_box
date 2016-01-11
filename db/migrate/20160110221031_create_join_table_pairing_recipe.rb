class CreateJoinTablePairingRecipe < ActiveRecord::Migration
  def change
    create_join_table :pairings, :recipes do |t|
      t.index [:pairing_id, :recipe_id]
      t.index [:recipe_id, :pairing_id]
    end
  end
end
