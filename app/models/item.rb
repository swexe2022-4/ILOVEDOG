class Item < ApplicationRecord
  belongs_to :user
  has_many    :review
  mount_uploader :avatar_path, AvatarUploader
end
