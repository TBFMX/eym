class Image < ActiveRecord::Base
	#######################################
	#extend FriendlyId
  	#friendly_id :title, :use => :slugged
	#######################################
	#belongs_to :gallery

	#validates :gallery_id, presence: true
	validates_format_of :name, :with => /^([^\/]*)$/i
end
