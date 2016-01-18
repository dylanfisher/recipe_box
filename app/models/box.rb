class Box < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  belongs_to :user

  scope :with_recipes,    -> { joins(:recipes).where('recipes.id IS NOT NULL') }
  scope :without_recipes, -> { includes(:recipes).where( recipes: { id: nil } ) }
end
