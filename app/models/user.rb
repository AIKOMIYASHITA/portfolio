class User < ApplicationRecord
  VALID_PASSWORD_REGEX=/\A(?=.*?[a-z])(?=.*?\d)(?=.*?[!-\/:-@\[-`{-~])[!-~]{8,32}+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  validates :name, presence: true, length: { maximum: 30 }

  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites,source: "topic"
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'

  has_many :sender_comments,class_name: "UserComment",foreign_key: "sender_id",dependent: :destroy
  has_many :senders,through: :sender_comments,source: :sender
  has_many :receiver_comments,class_name: "UserComment",foreign_key: "receiver_id",dependent: :destroy
  has_many :senders,through: :receiver_comments,source: :receiver

  def self.search(search)
    if search
      User.where(['name LIKE ? OR email LIKE ? ', "%#{search}%","%#{search}%"])
    else
      Post.all
    end
  end

end
