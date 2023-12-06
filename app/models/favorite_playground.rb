class FavoritePlayground < ApplicationRecord
  belongs_to :user
  belongs_to :playground
end
