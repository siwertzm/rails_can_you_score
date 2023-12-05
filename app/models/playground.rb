class Playground < ApplicationRecord
  has_many :trainings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
