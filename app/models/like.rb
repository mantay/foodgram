class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_id, :post_id, presence: true
  
end