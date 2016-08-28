class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :featured_image,
    styles: {
      sm: "768>",
      md: "992>",
      lg: "1170>",
      xl: "2000>",
    }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\Z/

  enum preparation_time: { quick: 0, time_consuming: 1 }

  after_save :touch!

  validates :title, :description, presence: true

  belongs_to :user
  belongs_to :jewel
  belongs_to :color_scheme

  has_many :steps, -> { order('position') }
  has_many :ingredients, -> { order('position') }

  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_and_belongs_to_many :boxes
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

  scope :recent,        -> { order(updated_at: :desc) }
  scope :random,        -> { order('random()') }
  scope :collected,     -> { joins(:boxes).where('boxes.id IS NOT NULL').distinct }
  scope :not_collected, -> { includes(:boxes).where( boxes: { id: nil } ) }
  scope :uploaded_by,   -> (user_id) { joins(:user).where('recipes.user_id = ?', user_id) }
  scope :collected_by,  -> (user_id) { joins(:boxes).where('boxes.user_id = ?', user_id) }
  scope :all_except,    -> (recipe) { where.not(id: recipe) }

  def color
    (color_scheme.color if color_scheme) || '#000000'
  end

  def diet_names
    diets.collect { |d| d.title }.to_sentence
  end

  def collected?
    boxes.any?
  end

  private

    def touch!
      self.touch
    end
end
