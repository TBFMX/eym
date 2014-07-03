class Image < ActiveRecord::Base
	####################################
	#extend FriendlyId
  	#friendly_id :title, :use => :slugged
	####################################
	belongs_to :gallery
end
