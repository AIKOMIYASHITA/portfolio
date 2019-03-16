class User < ApplicationRecord
  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites,source: "topic"
end
