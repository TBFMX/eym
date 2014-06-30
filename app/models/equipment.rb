class Equipment < ActiveRecord::Base
	has_many :galleries, dependent: :destroy
	has_many :images
	has_many :coments, dependent: :destroy
end
