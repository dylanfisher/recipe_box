class AddBackgroundColorToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :background_color, :string
  end
end
