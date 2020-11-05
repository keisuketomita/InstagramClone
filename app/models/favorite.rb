class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates :user_id, {presence: true}
  validates :blog_id, {presence: true}
end
