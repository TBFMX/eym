class Category < ActiveRecord::Base
	######################################
	#extend FriendlyId
	#friendly_id :name, :use => :slugged
	######################################
	validates :title, presence: true, uniqueness: true
	validates :father_id, presence: true
end
