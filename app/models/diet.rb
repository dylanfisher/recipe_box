class Diet < ActiveRecord::Base
  has_and_belongs_to_many :recipes

  validates_uniqueness_of :title, :case_sensitive => false
end
