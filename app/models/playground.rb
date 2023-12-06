class Playground < ApplicationRecord
  has_many :trainings
  has_many :favorite_playgrounds
  has_many :users, through: :favorite_playgrounds
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
