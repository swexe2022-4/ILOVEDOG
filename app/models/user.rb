class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :email,    presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX },
                       uniqueness: { case_sensitive: false }

  # 記憶トークンをハッシュ化するための関数
  # ここcostじゃなくてcost: ???
  def self.digest(string)
    cost = if ActiveModel::SecureRandom.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::PassWord.create(string, cost)
  end

  # ランダムなトークンを返す
  def self.new_token
    SecureRandom.urlsafe_base64
  end
end
