class Discount < ActiveRecord::Base
  belongs_to :equipment
  validates :titulo, presence: true, uniqueness: true
  validates :precio, :vencimiento, :equipment_id, presence: true
  validates :precio, numericality: {greater_than_or_equal_to: 0.01}
end
