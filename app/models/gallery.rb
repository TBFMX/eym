class Gallery < ActiveRecord::Base
	belongs_to :equipment
	has_many :images, dependent: :destroy
	has_many :videos, dependent: :destroy

end
