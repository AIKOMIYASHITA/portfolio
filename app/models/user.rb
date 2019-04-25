class User < ApplicationRecord
  VALID_PASSWORD_REGEX=/\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@\[-`{-~])[!-~]{8,32}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  validates :name, presence: true, uniqueness: true,
  length: { maximum: 15 }

  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites,source: "topic"
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'
end
