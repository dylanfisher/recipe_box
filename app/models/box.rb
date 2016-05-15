class Box < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :recipes
  has_and_belongs_to_many :jewels

  scope :with_recipes,    -> { joins(:recipes).where('recipes.id IS NOT NULL') }
  scope :without_recipes, -> { includes(:recipes).where( recipes: { id: nil } ) }
end
