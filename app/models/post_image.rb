class PostImage < ApplicationRecord

  belongs_to :user
  has_many :faved_users, through: :favs, source: :user

  attachment :image

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  validates :image, presence: true

  validates :comment, presence: true ,length: { in: 1..140 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
