class User < ApplicationRecord
  validates :name, presence:true, length: {maximum: 30}
  validates :email, presence:true, length: {maximum:255}, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence:true, length: { minimum: 6 }, on: :create
  mount_uploader :image, ImageUploader
  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog

  # before_update :admin_change_check
  # before_destroy :admin_change_check
  #
  #
  # def admin_change_check
  #   target = User.find_by(id: self.id)
  #   if current_user.admin && current_user == target
  #     throw :abort
  #   end
  # end

end
