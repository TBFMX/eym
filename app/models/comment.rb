class Comment < ActiveRecord::Base
	####################################
	extend FriendlyId
  	friendly_id :name, :use => :slugged
  	####################################
	belongs_to :equipment
end
