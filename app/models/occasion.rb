class Occasion < ActiveRecord::Base
  has_and_belongs_to_many :recipes
end
