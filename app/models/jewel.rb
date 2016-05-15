class Jewel < ActiveRecord::Base
  has_attached_file :image, styles: { small: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :recipes

  has_and_belongs_to_many :boxes
end
