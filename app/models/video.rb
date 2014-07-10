class Video < ActiveRecord::Base
	#####################################
	extend FriendlyId
  	friendly_id :title, :use => :slugged
  	#####################################
	belongs_to :gallery

	validates :gallery_id, presence: true
end
