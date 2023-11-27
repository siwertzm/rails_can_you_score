class Session < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
