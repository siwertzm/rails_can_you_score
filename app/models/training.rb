class Training < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :zone
  def shooting_efficiency
    return 0 if shot_total.zero?

    (shot_made.to_f / shot_total) * 100
  end
end
