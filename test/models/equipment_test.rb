require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  test "equipment price must be positive" do
	equipment = Equipment.new(name: 	    "My Book Title",
						  	  year: 		"yyy",
					   	  	  color:   		"zzz.jpg")
	equipment.precio = -1
	assert equipment.invalid?
	assert_equal ["must be greater than or equal to 0.01"], equipment.errors[:price]
	equipment.precio = 0
	assert equipment.invalid?
	assert_equal ["must be greater than or equal to 0.01"], equipment.errors[:price]
	equipment.precio = 1
	assert equipment.valid?
  end
end
