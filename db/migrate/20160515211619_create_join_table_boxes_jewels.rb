class CreateJoinTableBoxesJewels < ActiveRecord::Migration
  def change
    create_join_table :boxes, :jewels do |t|
      t.index [:box_id, :jewel_id]
      t.index [:jewel_id, :box_id]
    end
  end
end
