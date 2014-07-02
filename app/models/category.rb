class Category < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :father_id, presence: true
end
