class Comment < ActiveRecord::Base
  validates :post, presence: true
  validates :user, presence: true
  validates :body, presence: true
  belongs_to :user
  belongs_to :post
end
