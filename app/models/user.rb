class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :trainings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  def average_shooting_efficiency
    return 0 if trainings.empty?

    total_efficiency = trainings.sum { |training| training.shooting_efficiency }
    total_efficiency / trainings.size
  end
end
