class User < ApplicationRecord
<<<<<<< HEAD
  validates :name, presence:true, length: {maximum: 30}
  validates :email, presence:true, length: {maximum:255}, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence:true, length: { minimum: 6 }
=======
>>>>>>> 9c77ad610cfa9013a53d8359f10ff3285219640f
end
