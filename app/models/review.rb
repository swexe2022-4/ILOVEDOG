class Review < ApplicationRecord
  belongs_to :item
  has_many :user, through: :item

  validates :title,  presence: true, length: { maximum: 30 }
  validates :body,   presence: true, length: { maximum: 255 }
end
