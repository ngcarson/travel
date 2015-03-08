class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :ideas

  validates :name, presence: true

  validates :first_name, presence: true

  def self.human_attribute_name(attr, options = {})
    attr == :first_name ? 'First Name' : super
  end

  validates :last_name, presence: true

  def self.human_attribute_name(attr, options = {})
    attr == :last_name ? 'Last Name' : super
  end
end
