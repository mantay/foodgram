class Post < ActiveRecord::Base
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "500x500#", :small => "200x200#" }
  
  validates :user_id, :image, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|png)$/, :message => 'file type is not allowed (only jpeg/png images)'

  def like!(post)
    likes.create!(user_id: current_user.id, post_id: post.id)
  end

end
