class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trainings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_one_attached :banner

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users, source: :followed

  has_many :following_users, foreign_key: :followed_id, class_name: 'Follow'
  has_many :followers, through: :following_users, source: :follower

  has_many :favorite_playgrounds, dependent: :destroy

  has_many :playgrounds, through: :favorite_playgrounds

  has_many :notifs, dependent: :destroy

  def average_shooting_efficiency
    return 0 if trainings.empty?

    total_efficiency = trainings.sum { |training| training.shooting_efficiency }
    total_efficiency / trainings.size
  end

  def average_shooting_efficiency_by_zone(zone_id)
    return 0 if trainings.empty?

    total = trainings.where(zone_id: zone_id).sum(:shot_made).to_f
    ((total / trainings.where(zone_id: zone_id).sum(:shot_total).to_i) * 100).to_i
  end

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }
end
