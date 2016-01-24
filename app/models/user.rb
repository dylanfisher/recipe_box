class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_and_belongs_to_many :user_groups

  has_many :recipes
  has_one :box

  validates_presence_of :first_name, :last_name, :location

  scope :guest,                     -> { joins(:user_groups).where('user_groups.name = ?', 'guest').limit(1).first }
  scope :with_uploaded_recipes,     -> { where(:id => Recipe.select(:user_id).uniq) }
  scope :without_uploaded_recipes,  -> { where.not(:id => Recipe.select(:user_id).uniq) }
  # TODO: collected recipes scopes
  # scope :with_collected_recipes,    -> { joins(:box_recipes).where('recipe_id IS NOT NULL') }
  # scope :without_collected_recipes,    -> { joins(:box).where(box.) }

  def slug_candidates
    [
      :full_name,
      [:full_name, :id]
    ]
  end

  def name
    first_name || last_name || "Anonymous"
  end

  def full_name
    [first_name, last_name].reject(&:blank?).join(' ')
  end

  def in_group?(name)
    user_group_names.include?(name)
  end

  def user_group_names
    @user_group_names ||= user_groups.collect(&:name)
  end

  def uploaded_recipe_count
    recipes.count
  end

  def collected_recipe_count
    box.recipes.count
  end
end
