class AddAttachmentImageToJewels < ActiveRecord::Migration
  def self.up
    change_table :jewels do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :jewels, :image
  end
end
