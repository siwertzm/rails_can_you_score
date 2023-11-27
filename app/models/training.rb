class Training < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
