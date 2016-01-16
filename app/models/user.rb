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

  scope :guest, -> { joins(:user_groups).where('user_groups.name = ?', 'guest').limit(1).first }

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
    [first_name, last_name].join(' ')
  end
end
