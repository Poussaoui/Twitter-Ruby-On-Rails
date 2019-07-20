class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :name, length: { minimum: 3 }
  validates :name, length: { maximum: 8, too_long: "%{count} characters is the maximum allowed" }

  validates :image_url, presence: true

# for follow / unfollow

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  def self.following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  has_many :reverse_relationships, foreign_key: "followed_id",
                                 class_name:  "Relationship",
                                 dependent:   :destroy
has_many :followers, through: :reverse_relationships, source: :follower

# Follows a user.
def follow(other_user)
  relationships.create(followed_id: other_user.id)
end

# Unfollows a user.
def unfollow(other_user)
  relationships.find_by(followed_id: other_user.id).destroy
end

end
