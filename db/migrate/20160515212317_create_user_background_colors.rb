class CreateUserBackgroundColors < ActiveRecord::Migration
  def change
    create_table :user_background_colors do |t|

      t.timestamps null: false
    end
  end
end
