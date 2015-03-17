class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :ideas
  has_many :comments

  validates :name, presence: true, length: { maximum: 10 }
  validates_uniqueness_of :name

  validates :first_name, presence: true, length: { maximum: 20 }, format: { with:/\A[a-zA-Z_ ]+\Z/, message: 'Only letters are allowed' }
  
  def self.human_attribute_name(attr, options = {})
    attr == :first_name ? 'First Name' : super
  end

  validates :last_name, presence: true, length: { maximum: 20 }, format: { with:/\A[a-zA-Z_ ]+\Z/, message: 'Only letters are allowed' }

  def self.human_attribute_name(attr, options = {})
    attr == :last_name ? 'Last Name' : super
  end
end