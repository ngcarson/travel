class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  has_many :ideas
  has_many :comments

  # Form validator for Username input.
  validates :username, presence: true, length: { minimum: 3 }
  validates_uniqueness_of :username

  # Form validator for Firstname input.
  validates :first_name, presence: true, length: { minimum: 3 }, format: { with:/\A[a-zA-Z_ ]+\Z/, message: 'Only letters are allowed' }
  
  def self.human_attribute_name(attr, options = {})
    attr == :first_name ? 'First Name' : super
  end

  # Form validator for Lastname input.
  validates :last_name, presence: true, length: { minimum: 3 }, format: { with:/\A[a-zA-Z_ ]+\Z/, message: 'Only letters are allowed' }

  def self.human_attribute_name(attr, options = {})
    attr == :last_name ? 'Last Name' : super
  end

  # User model for Google signin API.
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(username: data["username"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
    end
  end
end