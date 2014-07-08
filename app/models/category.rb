class Category < ActiveRecord::Base
	######################################
	extend FriendlyId
	friendly_id :title, :use => :slugged
	######################################
	validates :title, presence: true, uniqueness: true
end
