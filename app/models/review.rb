class Review < ApplicationRecord
  belongs_to :item
  has_one :user, through: :item

  validates :item, uniqueness: true
  validates :title,  presence: true, length: { maximum: 30 }
  validates :body,   presence: true, length: { maximum: 255 }
end
