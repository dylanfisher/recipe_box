class AddAttachmentFeaturedImageToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :featured_image
    end
  end

  def self.down
    remove_attachment :recipes, :featured_image
  end
end
