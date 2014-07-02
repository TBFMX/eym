class Discount < ActiveRecord::Base
  belongs_to :equipment
  validates :titulo, presence: true, uniqueness: true
  validates :precio, :vencimiento, :equipment_id, presence: true
end
