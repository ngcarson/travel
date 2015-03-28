class Idea < ActiveRecord::Base
	# Sets up User association with posted Ideas.
	belongs_to :user
	has_many :comments

	# Configuration image sizes for PaperClip gem.
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	# Input destination is converted into geographic coordinates.
	geocoded_by :Destination
  after_validation :geocode

  # Form validator for Idea input.
  validates :Idea, presence: true, length: { minimum: 5 }
  validates :Destination, presence: true
end