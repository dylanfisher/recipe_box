class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :featured_image, styles: { medium: "500x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :jewel
  belongs_to :color_scheme

  has_many :boxes
  has_many :steps, -> { order('position') }
  has_many :ingredients, -> { order('position') }

  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_and_belongs_to_many :cuisines
  has_and_belongs_to_many :meal_types
  has_and_belongs_to_many :diets
  has_and_belongs_to_many :seasons
  has_and_belongs_to_many :occasions
  has_and_belongs_to_many :pairings,
              class_name: 'Recipe',
              join_table: :pairings_recipes,
              foreign_key: :recipe_id,
              association_foreign_key: :pairing_id

  scope :recent, -> { order(updated_at: :desc) }
  scope :all_except, -> (recipe) { where.not(id: recipe) }
end
