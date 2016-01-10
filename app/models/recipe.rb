class Recipe < ActiveRecord::Base
  has_attached_file :featured_image, styles: { medium: "500x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :jewel
  belongs_to :color_scheme
end
