class User < ApplicationRecord
  has_secure_password

  has_many :cards, dependent: :destroy
  has_many :trips, dependent: :destroy
  has_many :moods, dependent: :destroy

end
