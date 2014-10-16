class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "100x100#", :small => "50x50#" }
  has_many :identity
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :username, presence: true, length: { minimum: 3, maximum: 50 }
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|png)$/, :message => 'file type is not allowed (only jpeg/png images)'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  TEMP_EMAIL_REGEX = /not@verified.com/

  def self.from_omniauth(auth, signed_in_resources = nil)

    identity = Identity.find_for_oauth(auth)
    user = signed_in_resources ? signed_in_resources : identity.user

    if user.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      if user.nil?
        user = User.new(username: auth.info.name,
                        email: email ? email : "#{auth.uid}-not@verified.com",
                        password: "foobar")
        user.save
      end
    end

    unless identity.user == user
      identity.user = user
      identity.save
    end

    user

  end

  def email_verified?
    self.email !~ TEMP_EMAIL_REGEX
  end

  def migrate
  end

end
