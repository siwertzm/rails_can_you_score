class Notif < ApplicationRecord
  belongs_to :user
  belongs_to :training
  belongs_to :follow, class_name: 'User', foreign_key: 'follow_id'

  validates :user_id, presence: true
  validates :training_id, presence: true
end
